import 'package:flutter/material.dart';
import './widgets/appbar/app_bar_widget.dart';
import './widgets/level_button/level_button_widget.dart';
import './widgets/quiz_card/quiz_card_widget.dart';
import './home_controller.dart';
import './home_state.dart';
import '../core/core.dart';
import '../challenge/challenge_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();
  void initState() {
    super.initState();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    controller.load();
  }

  double get grade =>
      controller.quizzes.map((q) => q.grade).reduce((a, b) => (a + b) / 2);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var minLevelButtonSpace = size.width / 20;
    if (controller.state == HomeState.SUCCESS) {
      return Scaffold(
          appBar: AppBarWidget(user: controller.user, grade: grade),
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(children: [
                SizedBox(height: 24),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: minLevelButtonSpace),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: LevelButtonWidget.facil(), flex: 1),
                          SizedBox(width: minLevelButtonSpace),
                          Expanded(child: LevelButtonWidget.medio(), flex: 1),
                          SizedBox(width: minLevelButtonSpace),
                          Expanded(child: LevelButtonWidget.dificil(), flex: 1),
                          SizedBox(width: minLevelButtonSpace),
                          Expanded(child: LevelButtonWidget.perito(), flex: 1),
                        ])),
                SizedBox(height: 24),
                Expanded(
                    child: GridView.count(
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        crossAxisCount: (size.width / 200).round(),
                        children: controller.quizzes
                            .map((q) => QuizCardWidget(
                                quiz: q,
                                onTap: () {
                                  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChallengePage(quiz: q)))
                                      .then((_) {
                                    setState(() {});
                                  });
                                }))
                            .toList()))
              ])));
    } else {
      return Scaffold(
          body: Center(
              child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.darkGreen))));
    }
  }
}
