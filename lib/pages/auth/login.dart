import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/routes/app_route.dart';
import 'package:pedometer/constants.dart';
import 'package:pedometer/controller/auth/login_controller.dart';
import 'package:pedometer/widgets/back_icon.dart';
import 'package:pedometer/widgets/buttons/app_button.dart';
import 'package:pedometer/widgets/input/app_input.dart';
import 'package:pedometer/widgets/logo.dart';
import 'package:pedometer/widgets/text/heading_text_small.dart';
import 'package:pedometer/widgets/textButton/custom_text_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(
      LoginController(),
      permanent: false,
    );
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackIcon(),
            Expanded(
              child: Center(
                child: Form(
                  key: loginController.loginKey,
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Logo(radius: 30),
                        const SizedBox(height: 20),
                        const HeadingTextSmall(
                          text: 'welcome back! Glad to see you, Again!',
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 30),
                        AppInput(
                          textEditingController:
                              loginController.emailController,
                          hintText: 'email',
                          validator: emailValidator.call,
                        ),
                        const SizedBox(height: 15),
                        Obx(
                          () => AppInput(
                            textEditingController:
                                loginController.passwordController,
                            hintText: 'password',
                            obscureText: loginController.obsecure.value,
                            suffixIcon: IconButton(
                              onPressed:
                                  () =>
                                      loginController.obsecure.value =
                                          !loginController.obsecure.value,
                              icon:
                                  loginController.obsecure.value
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                            ),
                            validator: passwordValidator.call,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.only(right: 7),
                          alignment: Alignment.bottomRight,
                          child: CustomTextButton(
                            text: 'forgot Password?',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            onPressed:
                                () => Get.toNamed(AppRoute.forgotPassword),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Obx(
                          () => AppButton(
                            btnText: 'Submit',
                            isLoading: loginController.isSubmitting.value,
                            onClick: loginController.onSubmited,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 2,
              children: [
                CustomTextButton(
                  text: 'Don\'t have an account? ',
                  fontWeight: FontWeight.w500,
                  onPressed: () => Get.offNamed(AppRoute.registration),
                ),
                CustomTextButton(
                  text: 'Register Now',
                  fontColor: theme.colorScheme.secondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  onPressed: () => Get.offNamed(AppRoute.registration),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
