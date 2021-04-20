import 'package:DevQuiz/home/home_page.dart';
import 'package:DevQuiz/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("widget");
    return MaterialApp(
      title: "DevQuiz",
      home: HomePage(),
    );
  }
}
