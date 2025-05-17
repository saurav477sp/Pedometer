import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/routes/app_route.dart';
import 'package:pedometer/pages/get%20started/get_started_controller.dart';
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
  late GetStartedController getStartedController;

  @override
  void initState() {
    super.initState();
    getStartedController = Get.put(GetStartedController());
    getStartedController.delay();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
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
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
                opacity: getStartedController.textOpacity.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const HeadingTextBig(text: 'Start your', fontSize: 33),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        HeadingTextBig(
                          text: 'fitness',
                          fontSize: 33,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const HeadingTextBig(text: 'Journy', fontSize: 33),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => AnimatedOpacity(
                opacity: getStartedController.buttonOpacity.value,
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
                child: Column(
                  children: [
                    AppButton(
                      btnText: 'Login',
                      fillColor: theme.colorScheme.tertiary,
                      textColor: theme.colorScheme.onTertiary,
                      onClick: () => Get.toNamed(AppRoute.login),
                    ),
                    const SizedBox(height: 10),
                    AppButton(
                      onClick: () => Get.toNamed(AppRoute.registration),
                      btnText: 'Register',
                    ),
                    const SizedBox(height: 40,),
                    CustomTextButton(
                      text: 'Continue as guest',
                      textDecoration: TextDecoration.underline,
                      textDecorationColor: theme.colorScheme.onPrimary,
                      onPressed: () => Get.toNamed(AppRoute.home),
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
