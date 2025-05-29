import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/pages/statictics/controller/statictics_controller.dart';
import 'package:pedometer/widgets/text/label_text.dart';
import 'package:pedometer/widgets/text/text_style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CaloriesChart extends StatefulWidget {
  const CaloriesChart({super.key});

  @override
  State<CaloriesChart> createState() => _CaloriesChartState();
}

class _CaloriesChartState extends State<CaloriesChart> {
  final staticticsController = Get.find<StaticticsController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(() {
      final currentData = staticticsController.getCurrentData();
      final maxCalories =
          currentData.isEmpty
              ? 2000
              : currentData.map((e) => e.cal).reduce(max);

      return Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(top: 50), // Space for labels
                child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  margin: EdgeInsets.zero,
                  primaryXAxis: CategoryAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                    axisLine: const AxisLine(width: 0),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSecondary,
                      fontFamily: AppFontFamily.primary.toValues(),
                    ),
                  ),
                  primaryYAxis: NumericAxis(
                    isVisible: false,
                    minimum: 0,
                    maximum: maxCalories.toDouble(),
                  ),
                  onSelectionChanged: (args) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      staticticsController.chartIndex.value = args.pointIndex;
                    });
                  },
                  selectionGesture: ActivationMode.singleTap,
                  series: <CartesianSeries<SalesData, String>>[
                    ColumnSeries<SalesData, String>(
                      dataSource: currentData,
                      xValueMapper: (SalesData datum, _) => datum.day,
                      yValueMapper: (SalesData datum, _) => datum.cal,
                      borderRadius: BorderRadius.circular(10),
                      selectionBehavior: SelectionBehavior(
                        enable: true,
                        toggleSelection: false,
                        selectedColor: theme.colorScheme.onSecondary,
                        unselectedColor: theme.colorScheme.onSecondary.withOpacity(0.15),
                      ),
                      width: 0.3,
                      animationDuration: 500,
                      initialSelectedDataIndexes: [
                        staticticsController.chartIndex.value,
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LabelText(
                    text: 'Calories',
                    color: theme.colorScheme.onSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 2),
                  LabelText(
                    text: '${currentData.isEmpty ? 0 : currentData[staticticsController.chartIndex.value].cal.toInt()} cal',
                    color: theme.colorScheme.onSecondary,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class SalesData {
  final String day;
  final double cal;

  SalesData(this.day, this.cal);
}
