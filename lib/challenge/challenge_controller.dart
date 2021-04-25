import 'package:flutter/foundation.dart';
import '../shared/models/models.dart';

class ChallengeController {
  final currentQuestionNotifier = ValueNotifier<int>(0);
  int get currentQuestion => currentQuestionNotifier.value;
  set currentQuestion(int value) => currentQuestionNotifier.value = value;
}
