import 'package:flutter/material.dart';
// import '../core/core.dart';
import './widgets/quiz/quiz_widget.dart';
import './widgets/question_indicator/question_indicator_widget.dart';
import './widgets/next_button/next_button_widget.dart';
import '../shared/controllers/go_back_by_esc/go_back_by_esc_controller.dart';
import '../shared/models/models.dart';
import './challenge_controller.dart';

class ChallengePage extends StatefulWidget {
  final QuizModel quiz;
  ChallengePage({Key? key, required this.quiz}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  void _handleCurrentQuestionNotifier() {
    controller.currentQuestion = pageController.page!.round();
    print("current question ${controller.currentQuestion}");
    setState(() {});
  }

  void initState() {
    pageController.addListener(_handleCurrentQuestionNotifier);
    super.initState();
  }

  void dispose() {
    pageController.removeListener(_handleCurrentQuestionNotifier);
    super.dispose();
  }

  int? selected;

  QuestionModel get question =>
      widget.quiz.questions[controller.currentQuestion];
  bool get lastQuestion =>
      controller.currentQuestion + 1 == widget.quiz.questions.length;

  @override
  Widget build(BuildContext context) {
    print("rebuild challenge");
    print(this.controller.currentQuestion);
    return GoBackByEscController(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: SafeArea(
                    top: true,
                    child: ValueListenableBuilder<int>(
                        valueListenable: controller.currentQuestionNotifier,
                        builder: (context, value, _) => QuestionIndicatorWidget(
                            totalQuestoes: widget.quiz.questions.length,
                            questaoAtual: controller.currentQuestion)))),
            body: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: pageController,
                children: widget.quiz.questions
                    .map((q) => QuizWidget(
                        question: q,
                        onTap: (i) {
                          print("selected $i");
                          this.selected = i;
                        }))
                    .toList()),
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
                                  label: "Pular",
                                  onTap: () {
                                    if (!lastQuestion) {
                                      pageController.nextPage(
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.linear,
                                      );
                                      selected = question.answered;
                                    } else {
                                      // TODO: lógica de fim de questionario
                                      Navigator.pop(context);
                                    }
                                  })),
                          SizedBox(width: 7),
                          Expanded(
                              child: NextButtonWidget.green(
                                  label:
                                      lastQuestion ? "Finalizar" : "Confirmar",
                                  onTap: () async {
                                    if (selected == null) {
                                      return;
                                    }
                                    if (question.answered == null) {
                                      question.answered = selected;
                                    }
                                    await Future.delayed(Duration(seconds: 1));
                                    if (!lastQuestion) {
                                      pageController.nextPage(
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.linear,
                                      );
                                      selected = question.answered;
                                    } else {
                                      // TODO: lógica de fim de questionario
                                      Navigator.pop(context);
                                    }
                                  })),
                        ])))));
  }
}
