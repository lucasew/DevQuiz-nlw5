import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../answer/answer_widget.dart';
import '../../../shared/widgets/width_limiter/width_limiter_widget.dart';
import '../../../shared/models/models.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final Function(int) onTap;
  const QuizWidget({Key? key, required this.question, required this.onTap})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  void _triggerRedraw() {
    print(marked.value);
    setState(() {});
  }

  ValueNotifier<int?> marked = ValueNotifier<int?>(null);

  void initState() {
    super.initState();
    widget.question.answeredNotifier.addListener(_triggerRedraw);
    marked.addListener(_triggerRedraw);
  }

  void dispose() {
    super.dispose();
    widget.question.answeredNotifier.removeListener(_triggerRedraw);
    marked.removeListener(_triggerRedraw);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (var i = 0; i < widget.question.answers.length; i++) {
      var a = widget.question.answers[i];
      widgets.add(GestureDetector(
          onTap: () {
            widget.onTap(i);
            marked.value = i;
          },
          child: AnswerWidget(
              title: a.title,
              isRight: a.isRight,
              isSelected: widget.question.answered == i,
              isMarked: marked.value != null && marked.value == i)));
    }
    return WidthLimiterWidget(
        maxWidth: 400,
        child: ListView(children: [
          Text(widget.question.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          ...widgets
        ]));
  }
}
