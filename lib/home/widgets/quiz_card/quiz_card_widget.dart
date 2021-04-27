import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final String progress;
  final double percent;
  final VoidCallback onTap;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.progress,
    required this.onTap,
    this.percent = 0,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
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
        ),
      ),
    );
  }
}
