import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../answer/answer_widget.dart';
import '../../../shared/widgets/width_limiter/width_limiter_widget.dart';
import '../../../shared/models/models.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;
  const QuizWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (var i = 0; i < question.answers.length; i++) {
      var a = question.answers[i];
      widgets.add(AnswerWidget(
        title: a.title,
        isRight: a.isRight,
        isSelected: question.answered == i,
      ));
    }
    return WidthLimiterWidget(
        maxWidth: 400,
        child: ListView(children: [
          Text(question.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          ...widgets
        ]));
  }
}
