import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/theme/app_color.dart';
import 'package:pedometer/pages/settings/components/app_divider.dart';
import 'package:pedometer/pages/settings/components/app_list_tile.dart';
import 'package:pedometer/pages/settings/components/box_with_header.dart';
import 'package:pedometer/pages/settings/controller/setting_controller.dart';
import 'package:pedometer/widgets/text/body_text_big.dart';
import 'package:pedometer/widgets/text/label_text.dart';
import 'package:pedometer/widgets/text/sub_heading_text.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.put(SettingController());
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: 10,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 45),
                Stack(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.png'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: colrs.pink, width: 1),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          log(FirebaseAuth.instance.currentUser.toString());
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                BodyTextBig(
                  text: settingController.userName,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 5),
                LabelText(
                  text: '62 KG',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onPrimary.withOpacity(0.6),
                ),
                SizedBox(height: 15),
                BoxWithHeader(
                  headingText: 'App Settings',
                  widgetList: [
                    AppListTile(
                      title: 'Account Information',
                      trailingIconData: Icons.navigate_next_rounded,
                    ),
                    AppDivider(),
                    AppListTile(
                      title: 'Notifications',
                      trailingIconData: Icons.navigate_next_rounded,
                    ),
                    AppDivider(),
                    AppListTile(
                      title: 'Text Size',
                      trailing: SizedBox(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SubHeadingText(
                              text: 'Medium',
                              fontSize: 14,
                              color: theme.colorScheme.onPrimary.withOpacity(
                                0.6,
                              ),
                            ),
                            Icon(
                              Icons.navigate_next_rounded,
                              color: theme.colorScheme.onPrimary.withOpacity(
                                0.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                BoxWithHeader(
                  headingText: 'Support',
                  widgetList: [
                    AppListTile(title: 'Terms Of Service'),
                    AppDivider(),
                    AppListTile(title: 'Privacy Policy'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
