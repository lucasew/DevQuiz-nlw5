import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../answer/answer_widget.dart';
import '../../../shared/widgets/width_limiter/width_limiter_widget.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidthLimiterWidget(
        maxWidth: 400,
        child: ListView(children: [
          Text(title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          AnswerWidget(
              isRight: false,
              isSelected: true,
              title:
                  "Possibilita a criação de aplicativos compilados nativamente"),
          AnswerWidget(
              isRight: true,
              isSelected: true,
              title:
                  "Possibilita a criação de aplicativos compilados nativamente"),
          AnswerWidget(
              title:
                  "Possibilita a criação de aplicativos compilados nativamente"),
          AnswerWidget(
              title:
                  "Possibilita a criação de aplicativos compilados nativamente"),
          AnswerWidget(
              title:
                  "Possibilita a criação de aplicativos compilados nativamente"),
          AnswerWidget(
              title:
                  "Possibilita a criação de aplicativos compilados nativamente"),
          AnswerWidget(
              title:
                  "Possibilita a criação de aplicativos compilados nativamente")
        ]));
  }
}
