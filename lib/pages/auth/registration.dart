import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/routes/app_route.dart';
import 'package:pedometer/constants.dart';
import 'package:pedometer/controller/auth/regitration_controller.dart';
import 'package:pedometer/widgets/back_icon.dart';
import 'package:pedometer/widgets/buttons/app_button.dart';
import 'package:pedometer/widgets/input/app_input.dart';
import 'package:pedometer/widgets/logo.dart';
import 'package:pedometer/widgets/text/body_text_big.dart';
import 'package:pedometer/widgets/textButton/custom_text_button.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    RegistrationController registrationController = Get.put(
      RegistrationController(),
      permanent: false,
    );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          size.width * 0.05,
          80,
          size.width * 0.05,
          30,
        ),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackIcon(),
              const SizedBox(height: 50),
              const Logo(radius: 30),
              const SizedBox(height: 20),
              const BodyTextBig(text: 'Hello! Register to get started', fontSize: 27),
              const SizedBox(height: 30),
              Form(
                key: registrationController.registrationKey,
                child: Column(
                  spacing: 15,
                  children: [
                    AppInput(
                      textEditingController:
                          registrationController.userNameController,
                      hintText: 'Username',
                      validator:
                          MultiValidator([
                            RequiredValidator(
                              errorText: 'Username is required',
                            ),
                          ]).call,
                    ),
                    AppInput(
                      textEditingController:
                          registrationController.emailController,
                      hintText: 'Email',
                      validator: emailValidator.call,
                    ),
                    Obx(
                      () => AppInput(
                        textEditingController:
                            registrationController.passwordController,
                        hintText: 'Password',
                        obscureText:
                            registrationController.passwordObsecure.value,
                        suffixIcon: IconButton(
                          onPressed:
                              () =>
                                  registrationController
                                      .passwordObsecure
                                      .value = !registrationController
                                          .passwordObsecure
                                          .value,
                          icon:
                              registrationController.passwordObsecure.value
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                        ),
                        validator: passwordValidator.call,
                      ),
                    ),
                    Obx(
                      () => AppInput(
                        textEditingController:
                            registrationController.rePasswordController,
                        hintText: 'Conform Password',
                        obscureText:
                            registrationController.rePasswordObSecure.value,
                        suffixIcon: IconButton(
                          onPressed:
                              () =>
                                  registrationController
                                      .rePasswordObSecure
                                      .value = !registrationController
                                          .rePasswordObSecure
                                          .value,
                          icon:
                              registrationController.rePasswordObSecure.value
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                        ),
                        validator: (value) {
                          if (value !=
                              registrationController.passwordController.text) {
                            return 'conform password must same as password';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 5),
                    Obx(
                      () => AppButton(
                        btnText: 'Submit',
                        isLoading: registrationController.isProcessing.value,
                        onClick: registrationController.onSubmit,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 2,
                children: [
                  CustomTextButton(
                    text: 'Already have an account? ',
                    onPressed: () => Get.offNamed(AppRoute.login),
                    fontWeight: FontWeight.w500,
                  ),
                  CustomTextButton(
                    text: 'Login Now',
                    fontColor: theme.colorScheme.secondary,
                    fontSize: 14,
                    onPressed: () => Get.offNamed(AppRoute.login),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
