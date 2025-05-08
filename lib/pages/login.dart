import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/routes/app_route.dart';
import 'package:pedometer/controller/login_controller.dart';
import 'package:pedometer/pages/forgot_password.dart';
import 'package:pedometer/pages/registration.dart';
import 'package:pedometer/services/input_varification.dart';
import 'package:pedometer/widgets/back_icon.dart';
import 'package:pedometer/widgets/buttons/submit_button.dart';
import 'package:pedometer/widgets/input/app_input.dart';
import 'package:pedometer/widgets/logo.dart';
import 'package:pedometer/widgets/text/heading_text_small.dart';
import 'package:pedometer/widgets/textButton/custom_text_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController loginController = Get.put(LoginController());
  InputVarification inputVarification = InputVarification();
  RxBool isSuffixVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          size.width * 0.08,
          80,
          size.width * 0.08,
          30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackIcon(),
            Expanded(
              child: Center(
                child: Form(
                  key: loginController.loginKey,
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Logo(radius: 30),
                        SizedBox(height: 20),
                        HeadingTextSmall(
                          text: 'welcome back! Glad to see you, Again!',
                        ),
                        SizedBox(height: 30),
                        AppInput(
                          textEditingController:
                              loginController.emailController,
                          hintText: 'Email',
                          validator:
                              MultiValidator([
                                RequiredValidator(
                                  errorText: 'email is required',
                                ),
                                PatternValidator(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                                  errorText: 'please enter valide email',
                                ),
                              ]).call,
                        ),
                        SizedBox(height: 15),
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
                            validator:
                                MultiValidator([
                                  RequiredValidator(
                                    errorText: 'password is required',
                                  ),
                                  MinLengthValidator(
                                    7,
                                    errorText: 'password must be 8 degite long',
                                  ),
                                  PatternValidator(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                    errorText: 'please enter valide password',
                                  ),
                                ]).call,
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.only(right: 7),
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
                        SubmitButton(
                          text: 'Submit',
                          // onClick: () => inputValidate(),
                          onClick: () {
                            if (loginController.loginKey.currentState!
                                .validate()) {
                              loginController.onSubmited();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 2,
                children: [
                  CustomTextButton(
                    text: 'Don\'t have an account? ',
                    fontWeight: FontWeight.w500,
                    onPressed: () => Get.offAll(() => const Registration()),
                  ),
                  CustomTextButton(
                    text: 'Register Now',
                    fontColor: Colors.yellow,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    onPressed: () => Get.offAll(() => const Registration()),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
