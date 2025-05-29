import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedometer/pages/statictics/components/calories_chart.dart';
import 'package:pedometer/pages/statictics/components/config.dart';
import 'package:pedometer/pages/statictics/components/tab_model.dart';

class StaticticsController extends GetxController
    with GetTickerProviderStateMixin {
  RxInt selectedIndex = 0.obs;
  RxInt chartIndex = 0.obs;
  RxString averageText = ''.obs;
  RxString date = DateFormat('MMM d, y').format(DateTime.now()).obs;

  late List<TabModel> tabItems;
  late TabController tabController;

  final List<SalesData> dayData = [
    SalesData('12AM', 200),
    SalesData('3AM', 150),
    SalesData('6AM', 300),
    SalesData('9AM', 450),
    SalesData('12PM', 600),
    SalesData('3PM', 750),
    SalesData('6PM', 900),
    SalesData('9PM', 1050),
  ];

  final List<SalesData> weekData = [
    SalesData('Mon', 1020),
    SalesData('Tues', 1135),
    SalesData('Wed', 950),
    SalesData('Thurs', 1225),
    SalesData('Fri', 1300),
    SalesData('Sat', 1440),
    SalesData('Sun', 1560),
  ];

  final List<SalesData> monthData = [
    SalesData('Week 1', 6500),
    SalesData('Week 2', 7200),
    SalesData('Week 3', 6800),
    SalesData('Week 4', 7500),
  ];

  @override
  void onInit() {
    super.onInit();
    tabItems = Config.getItems();
    tabController = TabController(length: tabItems.length, vsync: this);
  }

  changeIndex(int index) {
    selectedIndex.value = index;
    chartIndex.value = 0;
    tabController.animateTo(
      index,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
    );
  }

  List<SalesData> getCurrentData() {
    switch (selectedIndex.value) {
      case 0:
        return dayData;
      case 1:
        return weekData;
      case 2:
        return monthData;
      default:
        return weekData;
    }
  }

  int getAverageCalories() {
    final currentData = getCurrentData();
    if (currentData.isEmpty) return 0;

    final total = currentData.fold(0.0, (sum, data) => sum + data.cal);
    return (total / currentData.length).round();
  }

  String getCurrentPeriodLabel() {
    switch (selectedIndex.value) {
      case 0:
        return 'Daily Average';
      case 1:
        return 'Weekly Average';
      case 2:
        return 'Monthly Average';
      default:
        return 'Average';
    }
  }
}
