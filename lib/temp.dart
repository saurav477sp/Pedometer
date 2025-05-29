import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/theme/app_color.dart';
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
    var wid = ((size.width - (2 * (size.width * 0.05)) - 8) / 3) - 5;
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            size.width * 0.05,
            75,
            size.width * 0.05,
            0,
          ),
          child: Column(
            children: [
              Row(
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
              const SizedBox(height: 20),
              Container(
                height: 85,
                decoration: BoxDecoration(
                  color: colrs.grey,
                  borderRadius: BorderRadius.circular(45),
                ),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  controller: staticticsController.tabController,
                  tabs: [
                    Tab(
                      child: Container(
                        width: wid,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        alignment: Alignment.center,
                        // padding: EdgeInsets.all(10),
                        child: BodyTextSmall(text: 'Day', fontSize: 15),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: wid,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        alignment: Alignment.center,
                        // padding: EdgeInsets.all(10),
                        child: BodyTextSmall(text: 'Week', fontSize: 15),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: wid,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        alignment: Alignment.center,
                        // padding: EdgeInsets.all(10),
                        child: BodyTextSmall(text: 'Month', fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
