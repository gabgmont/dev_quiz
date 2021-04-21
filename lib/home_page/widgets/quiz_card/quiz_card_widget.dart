import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Gerenciamento de Estado',
              style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(child: Text('3 de 10'),flex: 2,),
                Expanded(
                  flex: 3,
                  child: LinearProgressIndicatorWidget(value: .3),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
