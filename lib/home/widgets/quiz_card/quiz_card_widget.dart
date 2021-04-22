import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../../../shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: 40, width: 40, child: Image.asset(AppImages.blocks)),
              // SizedBox(height: 24),
              Text("Gerenciamento de Estado", style: AppTextStyles.heading15),
              // SizedBox(height: 24),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("3/10", style: AppTextStyles.body11),
                SizedBox(width: 10),
                Expanded(
                    flex: 1,
                    child: ProgressIndicatorWidget(
                      value: 0.3,
                    ))
              ])
            ]));
  }
}
