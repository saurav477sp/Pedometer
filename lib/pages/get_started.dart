import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/routes/app_route.dart';
import 'package:pedometer/test.dart';
import 'package:pedometer/widgets/buttons/app_button.dart';
import 'package:pedometer/widgets/buttons/app_icon_button.dart';
import 'package:pedometer/widgets/buttons/submit_button.dart';
import 'package:pedometer/widgets/input/app_input.dart';
import 'package:pedometer/widgets/logo.dart';
import 'package:pedometer/widgets/text/body_text_big.dart';
import 'package:pedometer/widgets/text/heading_text_big.dart';
import 'package:pedometer/widgets/textButton/custom_text_button.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  RxDouble textOpacity = 0.0.obs;
  RxDouble buttonOpacity = 0.0.obs;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () => textOpacity.value = 1.0);
    Future.delayed(const Duration(seconds: 4), () => buttonOpacity.value = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 30,
          right: size.width * 0.05,
          left: size.width * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 35,
          children: [
            Logo(),
            Obx(
              () => AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: textOpacity.value,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    HeadingTextBig(text: 'Start your', fontSize: 33),
                    Wrap(
                      spacing: 10,
                      children: [
                        HeadingTextBig(
                          text: 'fitness',
                          fontSize: 33,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        HeadingTextBig(text: 'Journy', fontSize: 33),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => AnimatedOpacity(
                opacity: buttonOpacity.value,
                duration: Duration(seconds: 1),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    SubmitButton(
                      text: 'Login',
                      color: theme.colorScheme.tertiary,
                      fontColor: theme.colorScheme.onTertiary,
                      onClick: () => Get.toNamed(AppRoute.login),
                    ),
                    SubmitButton(
                      text: 'Register',
                      color: theme.disabledColor,
                      onClick: () => Get.toNamed(AppRoute.registration),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 40),
                      child: CustomTextButton(
                        text: 'Continue as guest',
                        textDecoration: TextDecoration.underline,
                        onPressed: () => Get.offAllNamed(AppRoute.home),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
