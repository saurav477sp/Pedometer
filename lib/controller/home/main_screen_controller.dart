import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pedometer/widgets/bottombar/utils/config.dart';
import 'package:pedometer/widgets/bottombar/utils/navbar_item_model.dart';

class MainScreenController extends GetxController {
  RxInt navIndex = 0.obs;

  PageController pageController = PageController();
  RxList<NavbarItemModel> bottomOptions = <NavbarItemModel>[].obs;

  setNavOptions() {
    bottomOptions.value = Config.getConfigItems();
  }

  setIndex(int index) {
    if (index == navIndex.value) return;

    navIndex.value = index;
    pageController.jumpToPage(index);
  }
}
