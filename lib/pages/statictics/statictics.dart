import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/theme/app_color.dart';
import 'package:pedometer/pages/statictics/components/app_tab_bar.dart';
import 'package:pedometer/pages/statictics/components/statictics_chart.dart';
import 'package:pedometer/pages/statictics/controller/statictics_controller.dart';
import 'package:pedometer/widgets/icons/icon_or_svg.dart';
import 'package:pedometer/widgets/text/body_text_big.dart';
import 'package:pedometer/widgets/text/body_text_small.dart';
import 'package:pedometer/widgets/text/heading_text_big.dart';

class Statictics extends StatefulWidget {
  const Statictics({super.key});

  @override
  State<Statictics> createState() => _StaticticsState();
}

class _StaticticsState extends State<Statictics> with TickerProviderStateMixin {
  StaticticsController staticticsController = Get.put(StaticticsController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 75),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BodyTextSmall(
                          text: staticticsController.date.value,
                          color: theme.colorScheme.onSurface,
                        ),
                        HeadingTextBig(
                          text: 'Your\nStatictics',
                          textAlign: TextAlign.start,
                          color: theme.colorScheme.onSurface,
                        ),
                      ],
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 10),
                            BodyTextSmall(
                              text: 'Weekly Average',
                              color: theme.colorScheme.onSurface,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            BodyTextBig(
                              text: '102 CAL',
                              color: theme.colorScheme.onSurface,
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: colrs.pink,
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          child: IconOrSvg(
                            iconPath: 'assets/images/arrow_outword.svg',
                            iconColor: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // this below is for view od tabs
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: Obx(
                  () => AppTabBar(
                    selectedIndex: staticticsController.selectedIndex.value,
                    items: staticticsController.tabItems,
                    onTap:
                        (selectedIndex) =>
                            staticticsController.changeIndex(selectedIndex),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        height: 4,
                        width: 70,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.onBackground,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CaloriesChart()
                      // Stack(
                      //   children: [
                      //     Container(
                      //       width: double.infinity,
                      //       height: 250,
                      //       decoration: BoxDecoration(
                      //         color: theme.colorScheme.secondary,
                      //         borderRadius: BorderRadius.circular(50),
                      //       ),
                      //       padding: EdgeInsets.symmetric(
                      //         horizontal: 20,
                      //         vertical: 10,
                      //       ),
                      //       child: StaticticsChart()
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
