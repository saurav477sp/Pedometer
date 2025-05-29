// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pedometer/pages/statictics/controller/statictics_controller.dart';
// import 'package:pedometer/widgets/text/label_text.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class CaloriesChart extends StatefulWidget {
//   @override
//   _CaloriesChartState createState() => _CaloriesChartState();
// }

// class _CaloriesChartState extends State<CaloriesChart> {
//   final List<SalesData> data = [
//     SalesData('Mon', 20),
//     SalesData('Tues', 35),
//     SalesData('Wed', 50),
//     SalesData('Thurs', 25),
//     SalesData('Fri', 80),
//     SalesData('Sat', 40),
//     SalesData('Sun', 60),
//   ];

//   StaticticsController staticticsController = Get.put(StaticticsController());

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Container(
//       decoration: BoxDecoration(
//         color: Color(0xFFF5F1B2), // light yellow
//         borderRadius: BorderRadius.circular(30),
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       child: Column(
//         children: [
//           SizedBox(height: 20),
//           Stack(
//             children: [
//               Positioned(
//                 left: 10,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     LabelText(
//                       text: 'Calories',
//                       fontSize: 18,
//                       color: theme.colorScheme.onSecondary,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     SizedBox(height: 4),
//                     Obx(
//                       () => LabelText(
//                         text:
//                             '${data[staticticsController.chartIndex.value].cal.toInt()} cal',
//                         color: theme.colorScheme.onSecondary,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Obx(
//                 () => SfCartesianChart(
//                   plotAreaBorderWidth: 0,
//                   primaryXAxis: CategoryAxis(
//                     majorGridLines: MajorGridLines(width: 0),
//                     axisLine: AxisLine(width: 0),
//                     labelStyle: TextStyle(fontWeight: FontWeight.w400),
//                   ),
//                   primaryYAxis: NumericAxis(isVisible: false),
//                   onSelectionChanged: (args) {
//                     staticticsController.chartIndex.value = args.pointIndex;
//                   },
//                   series: [
//                     ColumnSeries<SalesData, String>(
//                       dataSource: data,
//                       xValueMapper: (datum, _) => datum.day,
//                       yValueMapper: (datum, _) => datum.cal,
//                       borderRadius: BorderRadius.circular(10),
//                       pointColorMapper: (datum, index) {
//                         if (staticticsController.chartIndex.value == index)
//                           return theme.colorScheme.primary;
//                         return Colors.grey[300];
//                       },
//                       selectionBehavior: SelectionBehavior(enable: true),
//                       width: 0.2,
//                     ),
//                   ],
//                 ),
//               ),

//               // Positioned(
//               //   bottom: 60 + data[selectedIndex!].cal, // dynamic positioning
//               //   left: MediaQuery.of(context).size.width / 10 * selectedIndex!,
//               //   child: Column(
//               //     children: [
//               //       Container(height: 10, width: 2, color: Colors.white),
//               //       Container(
//               //         height: 30,
//               //         width: 20,
//               //         decoration: BoxDecoration(
//               //           color: Colors.black,
//               //           shape: BoxShape.rectangle,
//               //           borderRadius: BorderRadius.circular(100),
//               //           boxShadow: [
//               //             BoxShadow(
//               //               color: Colors.black.withOpacity(0.2),
//               //               blurRadius: 10,
//               //               spreadRadius: 2,
//               //             ),
//               //           ],
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SalesData {
//   final String day;
//   final double cal;
//   SalesData(this.day, this.cal);
// }
