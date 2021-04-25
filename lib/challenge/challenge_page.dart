import 'package:flutter/material.dart';
// import '../core/core.dart';
import './widgets/quiz/quiz_widget.dart';
import './widgets/question_indicator/question_indicator_widget.dart';
import './widgets/next_button/next_button_widget.dart';
import '../shared/controllers/go_back_by_esc/go_back_by_esc_controller.dart';
import '../shared/models/models.dart';

class ChallengePage extends StatefulWidget {
  final QuizModel quiz;
  final int questao;
  ChallengePage({Key? key, required this.quiz, this.questao = 0})
      : assert(questao < quiz.questions.length),
        super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    var quiz = widget.quiz;
    return GoBackByEscController(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: SafeArea(
                    top: true,
                    child: QuestionIndicatorWidget(
                        quiz: quiz, questao: widget.questao))),
            body: QuizWidget(
              question: quiz.questions[widget.questao],
            ),
            bottomNavigationBar: SafeArea(
                bottom: true,
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: NextButtonWidget.white(
                                  label: "Fácil", onTap: () {})),
                          SizedBox(width: 7),
                          Expanded(
                              child: NextButtonWidget.green(
                                  label: "Confirmar", onTap: () {})),
                        ])))));
  }
}
