import 'package:flutter/material.dart';
import '../shared/models/models.dart';
import '../core/core.dart';
import '../shared/widgets/width_limiter/width_limiter_widget.dart';
import '../challenge/widgets/next_button/next_button_widget.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final QuizModel quiz;

  ResultPage({required this.quiz});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          Column(children: [
              SizedBox(height: 20),
            Image.asset(AppImages.trophy),
            Text("Parabéns!", style: AppTextStyles.heading40),
            SizedBox(height: 16),
            WidthLimiterWidget(
                maxWidth: 200,
                child: Text.rich(
                  TextSpan(
                      style: AppTextStyles.body,
                      text: "Você concluiu\n",
                      children: [
                        TextSpan(
                            text: quiz.title, style: AppTextStyles.bodyBold),
                        TextSpan(
                            text:
                                "\ncom ${quiz.questionsGot} de ${quiz.questionsAnswered} acertos.",
                            style: AppTextStyles.body)
                      ]),
                  textAlign: TextAlign.center,
                )),
          ]),
          Column(children: [
            WidthLimiterWidget(
                maxWidth: 200,
                child: Row(children: [
                  Expanded(
                      child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                              print("share");
                            Share.share("[DevQuiz] Olha que legal, eu acertei ${quiz.questionsGot} de ${quiz.questionsAnswered} (${(quiz.grade*100).round()}%) no quiz '${quiz.title}'!");
                          }))
                ])),
            SizedBox(height: 34),
            WidthLimiterWidget(
                maxWidth: 200,
                child: Row(children: [
                  Expanded(
                      child: NextButtonWidget.white(
                              label: "Voltar ao inicio", onTap: () {
                                Navigator.pop(context);
                              }))
                ])),
          ])
        ])));
  }
}
