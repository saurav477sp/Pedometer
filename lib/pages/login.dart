import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/pages/forgot_password.dart';
import 'package:pedometer/pages/registration.dart';
import 'package:pedometer/services/firebase/authentication.dart';
import 'package:pedometer/services/input_varification.dart';
import 'package:pedometer/widgets/back_icon.dart';
import 'package:pedometer/widgets/buttons/submit_button.dart';
import 'package:pedometer/widgets/input/custom_textfield.dart';
import 'package:pedometer/widgets/input/password_field.dart';
import 'package:pedometer/widgets/logo.dart';
import 'package:pedometer/widgets/text/body_big.dart';
import 'package:pedometer/widgets/textButton/custom_text_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Size size = Get.size;
  InputVarification inputVarification = InputVarification();
  RxBool isSuffixVisible = false.obs;

  void inputValidate() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter a valid email and password.');
      return;
    }
    if (!inputVarification.emailVarify(email)) {
      Get.snackbar('Error', 'Please enter a valid email.');
      return;
    }
    if (!inputVarification.passwordVarify(password)) {
      Get.snackbar('Error', 'Please enter a valid password.');
      return;
    }

    Authentication().signinUser(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.fromLTRB(size.width * 0.08, 80, size.width * 0.08, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const BackIcon(),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Logo(
                        radius: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const BodyBig(
                        text: 'welcome back! Glad to see you, Again!',
                        fontSize: 27,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextfield(
                          textEditingController: _emailController,
                          hintText: 'enter your email'),
                      const SizedBox(
                        height: 15,
                      ),
                      PasswordField(
                          textEditingController: _passwordController,
                          hintText: 'enter your password'),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 7),
                        alignment: Alignment.bottomRight,
                        child: CustomTextButton(
                          text: 'forgot Password?',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          onPressed: () => Get.to(() => const ForgotPassword()),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SubmitButton(
                        text: 'Submit',
                        color: Colors.white,
                        fontColor: Colors.black,
                        onClick: () => inputValidate(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                )
              ],
            )),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
