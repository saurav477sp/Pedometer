import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/pages/otp_varification.dart';
import 'package:pedometer/services/input_varification.dart';
import 'package:pedometer/services/messenging/otp_mail.dart';
import 'package:pedometer/services/otp_generator.dart';
import 'package:pedometer/widgets/back_icon.dart';
import 'package:pedometer/widgets/buttons/submit_button.dart';
import 'package:pedometer/widgets/custom_snackbar.dart';
import 'package:pedometer/widgets/input/custom_textfield.dart';
import 'package:pedometer/widgets/text/body_big.dart';
import 'package:pedometer/widgets/text/body_small.dart';
import 'package:pedometer/widgets/textButton/custom_text_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  Size size = Get.size;

  void otpGenerate() async {
    bool isValidEmail = InputVarification().emailVarify(_emailController.text);
    // bool isRegistered = await Authentication().isEmailRegistered(_emailController.text);
    // log(isRegistered);

    if (!isValidEmail) {
      CustomSnackbar.showSnackbar(
          'Error', 'Please enter a valid email address.');
      return;
    }
    // if (!isRegistered) {
    //   CustomSnackbar.showSnackbar('Error', 'No account found with this email.');
    //   return;
    // }

    // Generate and send OTP
    String otp = OtpGenerator().generateOTP();

    // check email is exist or not

    bool isotpSent = await OtpMail().sendOTP(_emailController.text, otp);
    isotpSent
        ? {
            Get.to(() => OtpVarification(
                  otp: otp,
                  email: _emailController.text,
                )),
            CustomSnackbar.showSnackbar('otp', otp),
          }
        : CustomSnackbar.showSnackbar('otp', 'otp not send');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.fromLTRB(size.width * 0.08, 80, size.width * 0.08, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackIcon(),
            const SizedBox(
              height: 45,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BodyBig(text: 'forgot Password?'),
                  const SizedBox(
                    height: 25,
                  ),
                  const BodySmall(
                    text:
                        'Don\'t worry! It occures. Please enter the email address linked with your account.',
                    fontWeight: FontWeight.w300,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextfield(
                    textEditingController: _emailController,
                    hintText: 'email',
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SubmitButton(
                      text: 'Send Code',
                      color: Colors.white,
                      fontColor: Colors.black,
                      onClick: () => otpGenerate()),
                ],
              ),
            )),
            const Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextButton(text: 'Remember Password? '),
                CustomTextButton(
                  text: 'Login',
                  fontColor: Colors.yellow,
                  fontSize: 14,
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
