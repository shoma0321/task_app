import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  //ToDo: ここに使用する変数を定義しよう！

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Re.Ra.Ku'),
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 2),
            Container(
              color: Colors.green,
              padding: const EdgeInsets.all(5.0),
              child: const Center(
                child: Text(
                  '以下の質問に回答で\nあなたにオススメのコースを算出します！',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const Spacer(),
            const Text('■ 本日のお疲れはどれくらいですか？', style: TextStyle(fontSize: 15)),
            const SizedBox(height: 20),
            Center(
              child: Text(
                '0',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
            ),
            Slider(
                min: 0,
                max: 10,
                value: 0,
                divisions: 10,
                onChanged: (value) {}),
            const Spacer(),
            const Text('■ 一番辛い箇所はどちらですか？', style: TextStyle(fontSize: 15)),
            const SizedBox(height: 10),
            DropdownButton(
                items: const [
                  DropdownMenuItem(child: Text('選択してください'), value: '選択してください'),
                ],
                value: '選択してください',
                underline: Container(
                  height: 1,
                  color: Colors.lightGreen,
                ),
                isExpanded: true,
                onChanged: (value) {}),
            const Spacer(),
            Center(
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      '決定',
                      style: TextStyle(fontSize: 15),
                    ))),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
