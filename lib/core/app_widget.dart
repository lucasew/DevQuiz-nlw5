import 'package:DevQuiz/home/home_page.dart';
// import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/splash/splash_page.dart';
import 'package:flutter/material.dart';
import '../home/home_controller.dart';

class AppWidget extends StatefulWidget {
  createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final ready = ValueNotifier<bool>(false);
  HomeController homeController = HomeController();

  void _handleStateChange() {
    setState(() {});
  }

  void initState() {
    ready.addListener(_handleStateChange);
    super.initState();
    Future.wait([homeController.load()]).then((_) {
      ready.value = true;
    });
  }

  void dispose() {
    super.dispose();
    ready.removeListener(_handleStateChange);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: ready.value ? HomePage(controller: homeController) : SplashPage(),
    );
  }
}
