import 'package:dev_quiz/challange/challange_controller.dart';
import 'package:dev_quiz/challange/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/challange/widgets/quiz/quiz_controller.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;

  const QuizWidget({Key? key, required this.question}) : super(key: key);

  @override
  QuizWidgetState createState() => QuizWidgetState();
}

class QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  AnswerModel answer(int index) => widget.question.answers[index];
  var qController = QuizController();

  void answerCheck(isRight){
    if(isRight)ChallangeController.rightHits++;
  }

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
                onSelected: (isRight){
                  answerCheck(isRight);
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
