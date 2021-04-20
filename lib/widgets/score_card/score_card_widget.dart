import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/widgets/chart/chart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: ChartWidget(),
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
