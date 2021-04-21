import 'package:flutter/material.dart';
import '../../../core/core.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 80, maxWidth: 80),
        child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Padding(
                padding: EdgeInsets.only(left: 12),
                child: Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.center,
                    children: [
                      Center(
                          child: CircularProgressIndicator(
                              strokeWidth: 10,
                              value: .75,
                              backgroundColor: AppColors.chartSecondary,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.chartPrimary))),
                      Center(child: Text("75%", style: AppTextStyles.heading.merge(TextStyle(fontSize: 10))))
                    ]))));
  }
}
