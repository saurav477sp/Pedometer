import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/pages/home.dart';
import 'package:pedometer/services/input_varification.dart';
import 'package:pedometer/widgets/back_icon.dart';
import 'package:pedometer/widgets/buttons/submit_button.dart';
import 'package:pedometer/widgets/popup/snackbar.dart';
import 'package:pedometer/widgets/input/password_field.dart';
import 'package:pedometer/widgets/text/body_text_big.dart';
import 'package:pedometer/widgets/text/body_text_small.dart';

class CreateNewPassword extends StatefulWidget {
  final String email;
  const CreateNewPassword({super.key, required this.email});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformPasswordController =
      TextEditingController();
  InputVarification inputVarification = InputVarification();
  Size size = Get.size;

  void inputValidate() async {
    if (_passwordController.text.isEmpty ||
        _conformPasswordController.text.isEmpty) {
      Get.snackbar('error', 'please enter all field');
      return;
    }

    if (!inputVarification.passwordVarify(_passwordController.text)) {
      Get.snackbar('password', 'please enter strong password');
      return;
    }

    if (_passwordController.text != _conformPasswordController.text) {
      Get.snackbar('password', 'both password should be same');
      return;
    }

    CustomSnackbar.showSnackbar('Done', 'Password is updated');
    Get.to(() => const Home());

    // await Authentication().changePassword(widget.email, _passwordController.text)
    //     ? Get.to(() => PasswordChangedUi())
    //     : CustomSnackbar.showSnackbar('not updated', 'password is not updated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.fromLTRB(size.width * 0.08, 80, size.width * 0.08, 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackIcon(),
              const SizedBox(
                height: 45,
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BodyTextBig(text: 'Create new Password'),
                    const SizedBox(
                      height: 15,
                    ),
                    const BodyTextSmall(
                      text:
                          'Yout new password must be unique from the previously used.',
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    PasswordField(
                        textEditingController: _passwordController,
                        hintText: 'password'),
                    const SizedBox(
                      height: 15,
                    ),
                    PasswordField(
                        textEditingController: _conformPasswordController,
                        hintText: 'Conform password'),
                    const SizedBox(
                      height: 20,
                    ),
                    SubmitButton(
                      text: 'Varify',
                      onClick: inputValidate,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
