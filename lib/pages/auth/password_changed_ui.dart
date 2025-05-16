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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomCheckUi(),
              SizedBox(height: 20),
              HeadingTextBig(text: 'Password Changed!'),
              SizedBox(height: 5),
              BodyTextSmall(
                text: 'Your password has been changed',
                fontWeight: FontWeight.w300,
                textAlign: TextAlign.left,
                fontSize: 16,
              ),
              Container(
                alignment: Alignment.center,
                child: BodyTextSmall(
                  text: 'successfully',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
