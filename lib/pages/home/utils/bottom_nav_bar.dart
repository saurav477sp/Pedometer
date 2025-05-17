import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/controller/home/main_screen_controller.dart';
import 'package:pedometer/widgets/bottombar/bottom_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    MainScreenController mainScreenController = Get.find<MainScreenController>();
    return Obx(
      () => BottomBar(
        onSelect: (selectedId) => mainScreenController.setIndex(selectedId),
        options: mainScreenController.bottomOptions.value,
        selectedId: mainScreenController.navIndex.value,
      ),
    );
  }
}
