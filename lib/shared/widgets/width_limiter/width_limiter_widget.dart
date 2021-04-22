import 'package:flutter/material.dart';

class WidthLimiterWidget extends StatelessWidget {
  final double maxWidth;
  final double minPadding;
  final Widget child;
  const WidthLimiterWidget(
      {Key? key,
      required this.maxWidth,
      required this.child,
      this.minPadding = 5});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width >= maxWidth
                ? (size.width - maxWidth) / 2
                : minPadding),
        child: child);
  }
}
