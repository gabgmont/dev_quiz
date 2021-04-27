import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/widgets/chart/chart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  final double percent;

  const ScoreCardWidget({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: ChartWidget(percent: percent,),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Vamos Começar', style: AppTextStyles.heading,),
                      Text('Complete os desafios e avançe em conhecimento', style: AppTextStyles.body,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
