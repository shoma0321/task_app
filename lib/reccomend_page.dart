import 'package:flutter/material.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('オススメのコース'),
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 2),
            Text(
              '疲労撃退コース30分',
              style: const TextStyle(
                fontSize: 30,
                color: Colors.green,
              ),
            ),
            const Spacer(),
            Text('肩甲骨を中心に全身をほぐしていくコースです'),
            const Spacer(),
            const SizedBox(height: 20),
            Center(
              child: Image.network(
                  'https://reraku.jp/wp-content/themes/reraku/src/images/shared/courses/hiro.jpg'),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('予約する', style: TextStyle(fontSize: 15)),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
