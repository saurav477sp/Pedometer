import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/controller/auth/password_changed_ui_controller.dart';
import 'package:pedometer/widgets/custom_check_ui.dart';
import 'package:pedometer/widgets/text/body_text_small.dart';
import 'package:pedometer/widgets/text/heading_text_big.dart';

class PasswordChangedUi extends StatefulWidget {
  const PasswordChangedUi({super.key});

  @override
  State<PasswordChangedUi> createState() => _PasswordChangedUiState();
}

class _PasswordChangedUiState extends State<PasswordChangedUi> {
  late PasswordChangedUiController passwordChangedUiController;

  @override
  void initState() {
    super.initState();
    passwordChangedUiController = Get.put(
      PasswordChangedUiController(),
      permanent: false,
    );
    passwordChangedUiController.getPassedData();
    passwordChangedUiController.init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCheckUi(),
            SizedBox(height: 20),
            HeadingTextBig(text: 'Password Changed!', fontSize: 25),
            SizedBox(height: 5),
            BodyTextSmall(
              text: 'Your password has been changed \n successfully',
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
