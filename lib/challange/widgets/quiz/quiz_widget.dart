import 'package:dev_Quiz/challange/widgets/answer/answer_widget.dart';
import 'package:dev_Quiz/core/app_text_styles.dart';
import 'package:dev_Quiz/shared/models/answer_model.dart';
import 'package:dev_Quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;

  const QuizWidget({Key? key, required this.question}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.question.title,
              style: AppTextStyles.heading,
            ),
            SizedBox(
              height: 24,
            ),
            for (var i = 0; i < widget.question.answers.length; i++)
              AnswerWidget(
                answer: answer(i),
                isSelected: indexSelected == i,
                disabled: indexSelected != -1,
                onTap: (){
                  indexSelected = i;
                  setState(() {});
                },
              ),
          ],
        ),
      ),
    );
  }
}
