import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../../../shared/widgets/progress_indicator/progress_indicator_widget.dart';
import '../../../shared/models/models.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int totalQuestoes;
  final int questaoAtual;
  const QuestionIndicatorWidget(
      {Key? key, required this.totalQuestoes, required this.questaoAtual})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
            child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Questão ${questaoAtual + 1}", style: AppTextStyles.body),
            Text("de $totalQuestoes", style: AppTextStyles.body)
          ]),
          SizedBox(height: 16),
          ProgressIndicatorWidget(value: questaoAtual / (totalQuestoes - 1))
        ])));
  }
}
