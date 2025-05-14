import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/controller/home/main_screen_controller.dart';
import 'package:pedometer/widgets/bottombar/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainScreenController mainScreenController = Get.put(
    MainScreenController(),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mainScreenController.setNavOptions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => PageView(
          controller: mainScreenController.pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) => mainScreenController.navIndex.value = index,
          children:
              mainScreenController.bottomOptions
                  .map((item) => item.getWidget!())
                  .toList(),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
