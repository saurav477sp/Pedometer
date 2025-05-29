import 'package:flutter/material.dart';
import 'package:pedometer/config/theme/app_color.dart';

class BarOfChart extends StatelessWidget {
  final Color? forgroundColor;
  final double barHeight;
  final double barWidth;
  const BarOfChart({
    super.key,
    this.forgroundColor,
    this.barHeight = 82,
    this.barWidth = 28,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: barHeight,
      width: barWidth,
      decoration: BoxDecoration(
        color: forgroundColor ?? colrs.onGreyWhight,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
