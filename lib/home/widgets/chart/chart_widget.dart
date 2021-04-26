import 'package:flutter/material.dart';
import '../../../core/core.dart';

class ChartWidget extends StatefulWidget {
  final double grade;
  const ChartWidget({Key? key, required this.grade}) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

// FIXME: animação não funciona
  void _initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(minutes: 1));
    _animation =
        Tween<double>(begin: 0.0, end: widget.grade == 0 ? 0.1 : widget.grade)
            .animate(_controller);
    _controller.forward();
  }

  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        constraints: BoxConstraints(maxHeight: 80, maxWidth: 80),
        child: AnimatedBuilder(
            animation: _animation,
            builder: (context, _) {
              print(_animation.value);
              return FittedBox(
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
                                    value: _animation.value,
                                    backgroundColor: AppColors.chartSecondary,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        AppColors.chartPrimary))),
                            Center(
                                child: Text(
                                    "${(_animation.value * 100).toInt()}%",
                                    style: AppTextStyles.heading
                                        .merge(TextStyle(fontSize: 10))))
                          ])));
            }));
  }
}
