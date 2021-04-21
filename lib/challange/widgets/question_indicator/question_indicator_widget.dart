import 'package:dev_Quiz/core/app_text_styles.dart';
import 'package:dev_Quiz/shared/widgets/progress_indicator/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
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
                Text('Questão 04', style: AppTextStyles.body),
                Text('de 10', style: AppTextStyles.body),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            LinearProgressIndicatorWidget(value: .4),
          ],
        ),
      ),
    );
  }
}
