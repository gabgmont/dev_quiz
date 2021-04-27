import 'package:dev_quiz/challange/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String quizTitle;
  final int totalQuestions;
  final int result;
  const ResultPage({Key? key, required this.quizTitle, required this.totalQuestions, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(AppImages.trophy),
                  Text('Parabéns!', style: AppTextStyles.heading40),
                  SizedBox(height: 20,),
                  Text.rich(
                    TextSpan(
                        text: 'Você concluiu',
                        style: AppTextStyles.body,
                        children: [
                          TextSpan(
                              text: '\n$quizTitle',
                              style: AppTextStyles.bodyBold),
                          TextSpan(
                              text: ' \ncom $result de $totalQuestions acertos.',
                              style: AppTextStyles.body),
                        ]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Column(children: [
              SizedBox(
                  height: 50,
                  width: 180,
                  child: NextButtonWidget.purple(
                      label: 'Compartilhar', onTap: () {
                        Share.share('DevQuiz_ NLW 5 - Flutter.\nQuiz $quizTitle: ${(result/totalQuestions)*100}% acertos!');
                  })),
              SizedBox(height: 8),
              TextButton(
                  child: Text('Voltar ao início.', style: AppTextStyles.body),
                  onPressed: () => Navigator.pop(context))
            ])
          ],
        ),
      ),
    );
  }
}
