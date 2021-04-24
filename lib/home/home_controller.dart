import '../shared/models/models.dart';
import './home_state.dart';
import '../core/core.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.EMPTY);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? _user;
  List<QuizModel>? _quizzes;

  Future<void> load() async {
    await Future.delayed(Duration(seconds: 2));
    _quizzes = [
      QuizModel(
          title: "NLW 5 - Flutter",
          level: Level.FACIL,
          imagem: AppImages.blocks,
          questions: [
            QuestionModel(
                answered: 1,
                title: "Está curtindo o Flutter?",
                answers: [
                  AnswerModel(title: "Adorei", isRight: true),
                  AnswerModel(title: "Amei", isRight: true),
                  AnswerModel(title: "Melhor tech ever", isRight: true),
                  AnswerModel(title: "Pica pa carai", isRight: true),
                  AnswerModel(title: "Odiei"),
                ]),
            QuestionModel(title: "Está curtindo o Flutter?", answers: [
              AnswerModel(title: "Adorei", isRight: true),
              AnswerModel(title: "Amei", isRight: true),
              AnswerModel(title: "Melhor tech ever", isRight: true),
              AnswerModel(title: "Pica pa carai", isRight: true),
              AnswerModel(title: "Odiei"),
            ]),
          ])
    ];
    _user = UserModel(
        name: "Lucão",
        photoUrl: "https://avatars.githubusercontent.com/u/15693688?v=4");
    this.state = HomeState.SUCCESS;
  }

  List<QuizModel> get quizzes {
    return _quizzes!;
  }

  UserModel get user {
    return _user!;
  }
}
