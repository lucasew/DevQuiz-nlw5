import 'package:flutter/material.dart';
import '../core/core.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: AppGradients.linear,
            ),
            child: Center(
              child: Image.asset(AppImages.logo),
            )));
  }
}
