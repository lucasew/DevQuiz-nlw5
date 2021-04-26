import 'package:flutter/material.dart';
import '../shared/models/models.dart';

class ResultPage extends StatelessWidget {
  final QuizModel quiz;

  ResultPage({required this.quiz});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("Result page"));
  }
}
