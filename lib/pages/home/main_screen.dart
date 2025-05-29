import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/controller/home/main_screen_controller.dart';
import 'package:pedometer/pages/home/utils/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainScreenController mainScreenController;

  @override
  void initState() {
    super.initState();
    mainScreenController = Get.put(MainScreenController());
    mainScreenController.setNavOptions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              controller: mainScreenController.pageController,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged:
                  (index) => mainScreenController.navIndex.value = index,
              itemBuilder: (BuildContext context, int index) {
                final item = mainScreenController.bottomOptions[index];
                return KeyedSubtree(
                  key: ValueKey(item.id),
                  child: item.getWidget!(),
                );
              },
            ),
          ),
          Positioned(left: 20, right: 20, bottom: 25, child: BottomNavBar()),
        ],
      ),
    );
  }
}
