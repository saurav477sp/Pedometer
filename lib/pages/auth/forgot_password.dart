import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/constants.dart';
import 'package:pedometer/controller/auth/forgot_password_controller.dart';
import 'package:pedometer/widgets/back_icon.dart';
import 'package:pedometer/widgets/buttons/app_button.dart';
import 'package:pedometer/widgets/input/app_input.dart';
import 'package:pedometer/widgets/text/body_text_small.dart';
import 'package:pedometer/widgets/text/heading_text_small.dart';
import 'package:pedometer/widgets/textButton/custom_text_button.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    ForgotPasswordController forgotPasswordController = Get.put(
      ForgotPasswordController(),
      permanent: false,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          size.width * 0.05,
          80,
          size.width * 0.05,
          30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 25,
          children: [
            const BackIcon(),
            const SizedBox(height: 10),
            const HeadingTextSmall(text: 'forgot Password?'),
            const BodyTextSmall(
              text:
                  'Don\'t worry! It occures. Please enter the email address linked with your account.',
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.left,
              fontSize: 16,
            ),
            Expanded(
              child: Form(
                key: forgotPasswordController.forgotPassKey,
                child: Column(
                  spacing: 35,
                  children: [
                    AppInput(
                      textEditingController:
                          forgotPasswordController.emailController,
                      hintText: 'Email',
                      validator: emailValidator.call,
                    ),
                    Obx(
                      () => AppButton(
                        btnText: 'Send Code',
                        isLoading: forgotPasswordController.isSubmiting.value,
                        loadingText: 'Sending otp...',
                        onClick: () => forgotPasswordController.onSubmit(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 2,
              children: [
                CustomTextButton(
                  text: 'Remember Password? ',
                  fontWeight: FontWeight.w500,
                  onPressed: () => Get.back(),
                ),
                CustomTextButton(
                  text: 'Login',
                  fontColor: theme.colorScheme.secondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
