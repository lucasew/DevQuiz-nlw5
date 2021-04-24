import './question_model.dart';
import './models.dart';

enum Level { FACIL, MEDIO, DIFICIL, PERITO }

extension LevelStringExtension on String {
    Level get toLevel => {
        "FACIL": Level.FACIL,
        "MEDIO": Level.MEDIO,
        "DIFICIL": Level.DIFICIL,
        "PERITO": Level.PERITO
    }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final String imagem;
  final Level level;

  int get questionsAnswered => this.questions.where((i) => i.isAnswered).length;
  int get questionsGot =>
      this.questions.where((q) => q.isAnswered && q.isRight).length;
  double get grade => questionsGot / questionsAnswered;

  QuizModel({
    required this.title,
    required this.questions,
    required this.imagem,
    required this.level,
  }) : assert(questions.length > 0);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'imagem': imagem,
      'level': level.toString()
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: map['questions'].map((q) => QuestionModel.fromMap(q)),
      imagem: map['imagem'],
      level: map['leve'].toString().toLevel
    );
  }
}
