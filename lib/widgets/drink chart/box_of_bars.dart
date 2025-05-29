import 'package:flutter/material.dart';
import 'package:pedometer/widgets/drink%20chart/bar_of_chart.dart';

class BoxOfBars extends StatelessWidget {
  final Color? backgroundColor;
  final Color? forgroundColor;
  const BoxOfBars({super.key, this.backgroundColor, this.forgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          BarOfChart(barHeight: 46),
          BarOfChart(barHeight: 67),
          BarOfChart(barHeight: 82),
        ],
      ),
    );
  }
}
