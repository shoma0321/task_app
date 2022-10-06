import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_intern_task_recommend_app/question_page.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendPage extends StatefulWidget {
  final double tiredPoint;
  final String painPart;
  const RecommendPage(this.tiredPoint, this.painPart, {Key? key})
      : super(key: key);

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  Future<Map?> getMenu() async {
    try {
      var dio = Dio();
      Response response = await dio.post(
        'https://17q704uif3.execute-api.ap-northeast-1.amazonaws.com/recommend_course/recommend_courese',
        data: {
          'painPart': widget.painPart,
          'tiredPoint': widget.tiredPoint.toInt()
        },
        options: Options(
          headers: {'x-api-key': '2FVBf65ZKe8SlAVuMsYQT7FI2CE8KYiN4ldJ6OA4'},
        ),
      );

      if (response.data['statusCode'] == 200) {
        Map<String, dynamic> mapData = jsonDecode(response.data['body']);
        return mapData['course'];
      } else {
        const snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: Text('エラーが発生しました。もう一度お試しください。',
              style: TextStyle(color: Colors.white)),
        );
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuestionPage(),
            ));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      const snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text('不明なエラーが発生しました。もう一度お試しください。',
            style: TextStyle(color: Colors.white)),
      );

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionPage(),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('オススメのコース'),
        centerTitle: false,
      ),
      body: FutureBuilder<Map?>(
        future: getMenu(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<Map?> mapData) {
          if (mapData.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (mapData.hasError) {
            return Text('予期せぬエラーが発生しました。もう一度お試しください。');
          } else if (!mapData.hasData) {
            return Text('予期せぬエラーが発生しました。もう一度お試しください。');
          }
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                Text(
                  '${mapData.data!['name']}',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.green,
                  ),
                ),
                const Spacer(),
                Text('${mapData.data!['courseExplanation']}'),
                const Spacer(),
                const SizedBox(height: 20),
                Center(
                  child: Image.network(mapData.data!['imageUrl'].toString()),
                ),
                const Spacer(),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final url = Uri.parse(
                        'https://reraku.jp/course',
                      );
                      if (await canLaunchUrl(url)) {
                        launchUrl(url);
                      } else {
                        // ignore: avoid_print
                        print("Can't launch $url");
                      }
                    },
                    child: const Text('予約する', style: TextStyle(fontSize: 15)),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          );
        },
      ),
    );
  }
}
