import 'package:flutter/material.dart';
import 'package:flutter_intern_task_recommend_app/question_page.dart';

void main() {
  runApp(const RecommendApp());
}

class RecommendApp extends StatelessWidget {
  const RecommendApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recommend Re.Ra.Ku courses',
      theme: ThemeData(primarySwatch: Colors.green),
      home: QuestionPage(),
    );
  }
}
