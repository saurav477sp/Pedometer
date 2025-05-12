import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/routes/app_route.dart';
import 'package:pedometer/widgets/buttons/app_button.dart';
import 'package:pedometer/widgets/logo.dart';
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
    delay();
  }

  void delay() async {
    await Future.delayed(
      const Duration(microseconds: 1500),
      () => textOpacity.value = 1.0,
    );
    await Future.delayed(
      const Duration(milliseconds: 1500),
      () => buttonOpacity.value = 1.0,
    );
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
            const Logo(),
            Obx(
              () => AnimatedOpacity(
                duration: Duration(seconds: 1),
                curve: Curves.easeIn,
                opacity: textOpacity.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeadingTextBig(text: 'Start your', fontSize: 33),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                curve: Curves.easeIn,
                child: Column(
                  children: [
                    AppButton(
                      btnText: 'Login',
                      fillColor: theme.colorScheme.tertiary,
                      textColor: theme.colorScheme.onTertiary,
                      onClick: () => Get.toNamed(AppRoute.login),
                    ),
                    SizedBox(height: 10),
                    AppButton(
                      onClick: () => Get.toNamed(AppRoute.registration),
                      btnText: 'Register',
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
