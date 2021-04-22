import 'package:flutter/material.dart';
import './widgets/appbar/app_bar_widget.dart';
import './widgets/level_button/level_button_widget.dart';
import './widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var minLevelButtonSpace = size.width / 20;
    return Scaffold(
        appBar: AppBarWidget(),
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
                      children: [
                    QuizCardWidget(),
                    QuizCardWidget(),
                    QuizCardWidget(),
                    QuizCardWidget()
                  ]))
            ])));
  }
}
