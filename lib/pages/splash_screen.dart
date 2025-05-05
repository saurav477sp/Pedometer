import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/pages/home.dart';
import 'package:pedometer/pages/login.dart';
import 'package:pedometer/pages/registration.dart';
import 'package:pedometer/config/theme/custom_colors.dart';
import 'package:pedometer/widgets/buttons/submit_button.dart';
import 'package:pedometer/widgets/custom_snackbar.dart';
import 'package:pedometer/widgets/logo.dart';
import 'package:pedometer/widgets/text/body_big.dart';
import 'package:pedometer/widgets/textButton/custom_text_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Size size;
  RxDouble textOpacity = 0.0.obs;
  RxDouble buttonOpacity = 0.0.obs;
  RxDouble logoOpacity = 0.0.obs;

  @override
  void initState() {
    super.initState();
    CustomSnackbar.showSnackbar('pendind', 'this pedometer is pending');
    Future.delayed(const Duration(seconds: 2), () => textOpacity.value = 1.0);
    Future.delayed(const Duration(seconds: 4), () => buttonOpacity.value = 1.0);
    Future.delayed(
        const Duration(milliseconds: 500), () => logoOpacity.value = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() => AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: logoOpacity.value,
                child: const Logo(),
              )),
          const SizedBox(
            height: 35,
          ),
          Obx(
            () => AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: textOpacity.value,
              child: const Wrap(
                alignment: WrapAlignment.center,
                children: [
                  BodyBig(text: 'Start your'),
                  Wrap(
                    spacing: 10,
                    children: [
                      BodyBig(text: 'fitness', color: CustomColors.yellowColor),
                      BodyBig(text: 'Journy'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Obx(() => AnimatedOpacity(
                opacity: buttonOpacity.value,
                duration: const Duration(seconds: 1),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  // runSpacing: 6,
                  children: [
                    SubmitButton(
                      text: 'Login',
                      onClick: () => Get.to(() => const Login()),
                    ),
                    SubmitButton(
                      text: 'Register',
                      color: Colors.white,
                      fontColor: Colors.black,
                      onClick: () => Get.to(() => const Registration()),
                    ),
                    Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 40),
                        child: CustomTextButton(
                          text: 'Continue as guest',
                          textDecoration: TextDecoration.underline,
                          onPressed: () => Get.to(() => const Home()),
                        )),
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
