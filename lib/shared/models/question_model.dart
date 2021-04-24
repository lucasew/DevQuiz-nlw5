import './answer_model.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> answers;
  final int? answered;

  get isAnswered => answered != null;
  get isRight {
    if (isAnswered) {
      return answers.elementAt(answered as int).isRight;
    } else {
      return null;
    }
  }

  // TODO: acho que o layout aceita mais, dá pra fazer um range
  QuestionModel({
    required this.title,
    required this.answers,
    this.answered,
  })  : assert(answers.length == 5),
        assert(answered == null ? true : answered < answers.length);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'answers': answers.map((x) => x.toMap()).toList(),
      'answered': answered
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
        title: map['title'],
        answers: map['answers'].map((a) => AnswerModel.fromMap(a)));
  }
}
