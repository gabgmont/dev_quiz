import 'package:dev_Quiz/core/app_colors.dart';
import 'package:dev_Quiz/core/app_images.dart';
import 'package:dev_Quiz/core/app_text_styles.dart';
import 'package:dev_Quiz/shared/widgets/progress_indicator/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final String progress;
  final double percent;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.progress,
    this.percent = 0,
  }) : super(key: key);

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
              child: Image.asset('assets/images/$image.png'),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(progress),
                  flex: 2,
                ),
                Expanded(
                  flex: 3,
                  child: LinearProgressIndicatorWidget(value: percent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
