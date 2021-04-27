import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const QuestionIndicatorWidget({Key? key, required this.currentPage, required this.totalPages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Questão $currentPage', style: AppTextStyles.body),
                Text('de $totalPages', style: AppTextStyles.body),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            LinearProgressIndicatorWidget(value: currentPage/totalPages),
          ],
        ),
      ),
    );
  }
}
