import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/pages/home.dart';
import 'package:pedometer/pages/login.dart';
import 'package:pedometer/services/firebase/authentication.dart';
import 'package:pedometer/services/input_varification.dart';
import 'package:pedometer/widgets/back_icon.dart';
import 'package:pedometer/widgets/buttons/submit_button.dart';
import 'package:pedometer/widgets/custom_circularprogressindicator.dart';
import 'package:pedometer/widgets/custom_snackbar.dart';
import 'package:pedometer/widgets/input/custom_textfield.dart';
import 'package:pedometer/widgets/input/password_field.dart';
import 'package:pedometer/widgets/logo.dart';
import 'package:pedometer/widgets/text/body_big.dart';
import 'package:pedometer/widgets/textButton/custom_text_button.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformPasswordController =
      TextEditingController();
  RxBool isSuffixVisible = false.obs;
  RxBool isLoading = false.obs;
  late InputVarification inputVarification;
  late Size size;
  late Authentication authentication;

  @override
  void initState() {
    super.initState();
    inputVarification = InputVarification();
    size = Get.size;
    authentication = Authentication();
  }

  Future<void> inputValidate() async {
    // Check for empty fields
    if (_usernameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _conformPasswordController.text.isEmpty) {
      Get.snackbar('empty', 'please enter all field');
      return;
    } else if (!inputVarification.emailVarify(_emailController.text)) {
      Get.snackbar('email', 'please enter valide email');
    } else if (!inputVarification.passwordVarify(_passwordController.text)) {
      Get.snackbar('password', 'please enter strong password');
    } else if (_passwordController.text != _conformPasswordController.text) {
      Get.snackbar('password', 'both password must be same');
    } else {
      isLoading.value = true;
      bool check = await authentication.signUpwithEmailandPassword(
          userName: _usernameController.text,
          email: _emailController.text,
          password: _passwordController.text);
      if (check) {
        isLoading.value = false;
        Get.to(() => const Home());
      } else {
        isLoading.value = false;
        CustomSnackbar.showSnackbar('error', 'something went wrong');
      }
    }

    // Validate email format
    if (!inputVarification.emailVarify(_emailController.text)) {
      Get.snackbar('email', 'please enter valide email');
      return;
    }

    // Validate password strength
    if (!inputVarification.passwordVarify(_passwordController.text)) {
      Get.snackbar('password', 'please enter strong password');
      return;
    }

    // Check if passwords match
    if (_passwordController.text != _conformPasswordController.text) {
      Get.snackbar('password', 'both password must be same');
      return;
    }

    // Start loading state
    isLoading.value = true;

    // Attempt registration
    bool check = await authentication.signUpwithEmailandPassword(
        userName: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text);

    check
        ? Get.to(() => const Home())
        : CustomSnackbar.showSnackbar('error', 'something went wrong');
    isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    size.width * 0.08, 80, size.width * 0.08, 30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BackIcon(),
                      const SizedBox(
                        height: 50,
                      ),
                      const Logo(
                        radius: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const BodyBig(
                        text: 'Hello! Register to get started',
                        fontSize: 27,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextfield(
                          textEditingController: _usernameController,
                          hintText: 'Username'),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextfield(
                          textEditingController: _emailController,
                          hintText: 'Email'),
                      const SizedBox(
                        height: 15,
                      ),
                      PasswordField(
                          textEditingController: _passwordController,
                          hintText: 'Password'),
                      const SizedBox(
                        height: 15,
                      ),
                      PasswordField(
                          textEditingController: _conformPasswordController,
                          hintText: 'Conform Password'),
                      const SizedBox(
                        height: 20,
                      ),
                      SubmitButton(
                        text: 'Submit',
                        color: Colors.white,
                        fontColor: Colors.black,
                        onClick: () => inputValidate(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 70),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextButton(
                                text: 'Already have an account? ',
                                onPressed: () => Get.to(const Login()),
                                fontWeight: FontWeight.w500),
                            CustomTextButton(
                              text: 'Login Now',
                              fontColor: Colors.yellow,
                              fontSize: 14,
                              onPressed: () => Get.to(const Login()),
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (isLoading.value) const CustomCircularProgressIndicator(),
            ],
          )),
    );
  }
}
