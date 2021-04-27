import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final double percent;

  const ChartWidget({Key? key, required this.percent}) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _chartAnimation;

  void initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _chartAnimation = Tween<double>(begin: 0.0, end: widget.percent)
        .animate(_animationController);
    _animationController.forward();
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: AnimatedBuilder(
        animation: _chartAnimation,
        builder: (context, _) => Stack(
          children: [
            Center(
              child: Container(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: _animationController.value,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              ),
            ),
            Center(
              child: Text(
                '${(_animationController.value*100).toInt()}%',
                style: AppTextStyles.heading,
              ),
            )
          ],
        ),
      ),
    );
  }
}
