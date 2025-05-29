import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedometer/pages/statictics/components/config.dart';
import 'package:pedometer/pages/statictics/components/tab_model.dart';

class StaticticsController extends GetxController
    with GetTickerProviderStateMixin {
  RxInt selectedIndex = 0.obs;
  RxString date = DateFormat('MMM d, y').format(DateTime.now()).obs;

  late List<TabModel> tabItems;
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabItems = Config.getItems();
    tabController = TabController(length: tabItems.length, vsync: this);
  }

  changeIndex(int index) {
    selectedIndex.value = index;
    tabController.animateTo(
      index,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
    );
  }
}
