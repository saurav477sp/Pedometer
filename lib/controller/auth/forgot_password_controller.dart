import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/routes/app_route.dart';
import 'package:pedometer/helper/firebase_database_helper.dart';
import 'package:pedometer/services/messenging/otp_mail.dart';
import 'package:pedometer/services/otp_generator.dart';
import 'package:pedometer/widgets/popup/snackbar.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final forgotPassKey = GlobalKey<FormState>();
  final isSubmiting = false.obs;

  onSubmit() async {
    if (forgotPassKey.currentState!.validate()) {
      isSubmiting.value = true;

      // this is an temperary solution
      // if we remove an email enamuration from console then fetchSignInMethodsForEmail is work but that is not recomended
      // so i set email as an key of all userdata and fetch it and then check and then work
      // console does not except . , $ , # , [ , ] so choose it carfully

      Map<String, dynamic>? data = await FirebaseDatabaseHelper().findEmail(
        emailController.text,
      );
      log('data of user =======> $data');

      // this is an real method to get email is used or not but email enamuration is eanble so it return empty list so it is not working
      // bool isEmailExist = await FirebaseHelper().isEmailRegistered(
      //   emailController.text,
      // );
      // log('return ============? ');

      if (data != null) {
        String otp = OtpGenerator().generateOTP();
        log(otp);
        bool isOtpSent = await OtpMail().sendOTP(emailController.text, otp);

        if (isOtpSent) {
          log('passing email ======> ${emailController.text}');
          log('passing otp =====> $otp');
          Get.toNamed(
            AppRoute.otpVarification,
            parameters: {'email': emailController.text, 'otp': otp},
          );
          forgotPassKey.currentState!.reset();
          emailController.clear();
        }
      } else {
        showSnackbar('email does not exist, please check email again');
      }
    }
    isSubmiting.value = false;
  }
}
