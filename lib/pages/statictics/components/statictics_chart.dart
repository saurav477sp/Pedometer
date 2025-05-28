import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CaloriesChart extends StatefulWidget {
  @override
  _CaloriesChartState createState() => _CaloriesChartState();
}

class _CaloriesChartState extends State<CaloriesChart> {
  int? selectedIndex;

  final List<SalesData> data = [
    SalesData('Mon', 20),
    SalesData('Tues', 35),
    SalesData('Wed', 50),
    SalesData('Thurs', 25),
    SalesData('Fri', 80),
    SalesData('Sat', 40),
    SalesData('Sun', 60),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF5F1B2), // light yellow
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Calories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  selectedIndex != null
                      ? '${data[selectedIndex!].cal.toInt()} cal'
                      : 'Select a day',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              SfCartesianChart(
                plotAreaBorderWidth: 0,
                backgroundColor: Colors.transparent,
                primaryXAxis: CategoryAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  axisLine: AxisLine(width: 0),
                  labelStyle: TextStyle(fontWeight: FontWeight.w400),
                ),
                primaryYAxis: NumericAxis(isVisible: false),
                onSelectionChanged: (args) {
                  setState(() {
                    selectedIndex = args.pointIndex;
                  });
                },
                series: [
                  ColumnSeries<SalesData, String>(
                    dataSource: data,
                    xValueMapper: (datum, _) => datum.day,
                    yValueMapper: (datum, _) => datum.cal,
                    borderRadius: BorderRadius.circular(10),
                    pointColorMapper: (datum, index) {
                      if (selectedIndex == index) return Colors.black;
                      return Colors.grey[300];
                    },
                    selectionBehavior: SelectionBehavior(enable: true),
                    width: 0.2,
                  ),
                ],
              ),

              // 🔥 Custom selection indicator
              if (selectedIndex != null)
                Positioned(
                  bottom: 60 + data[selectedIndex!].cal, // dynamic positioning
                  left: MediaQuery.of(context).size.width / 10 * selectedIndex!,
                  child: Column(
                    children: [
                      Container(height: 10, width: 2, color: Colors.white),
                      Container(
                        height: 30,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class SalesData {
  final String day;
  final double cal;
  SalesData(this.day, this.cal);
}
