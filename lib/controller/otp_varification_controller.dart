import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/routes/app_route.dart';
import 'package:pedometer/services/messenging/otp_mail.dart';
import 'package:pedometer/services/otp_generator.dart';
import 'package:pedometer/widgets/popup/snackbar.dart';

class OtpVarificationController extends GetxController {
  String email = '';
  final int otpLength = 4;
  List<TextEditingController> otpController = [];
  List<FocusNode> otpFocusNode = [];
  String generatedOtp = '';
  RxBool isVarifying = false.obs;
  RxBool isOtpResend = false.obs;
  RxInt timerSeconds = 60.obs;
  Timer? countdownTimer;

  String get fullOtp => otpController.map((e) => e.text).join();

  @override
  void onInit() {
    super.onInit();
    for (int i = 0; i < otpLength; i++) {
      otpController.add(TextEditingController());
      otpFocusNode.add(FocusNode());
    }
    startTimer();
  }

  @override
  void onClose() {
    for (final controller in otpController) {
      controller.dispose();
    }
    for (final node in otpFocusNode) {
      node.dispose();
    }
    clearOtp();
    super.onClose();
  }

  // clear otp
  void clearOtp() {
    for (final controller in otpController) {
      controller.clear();
    }
    if (otpFocusNode.isNotEmpty) {
      otpFocusNode[0].requestFocus();
    }
  }

  // get passed data
  void getPassedData() {
    String? email = Get.parameters['email'];
    String? otp = Get.parameters['otp'];
    if (email != null || otp != null) {
      this.email = email ?? '';
      generatedOtp = otp ?? '';
      log('email ==> ${this.email} and OTP ====> $generatedOtp');
    } else {
      log('parameter data is null');
    }
  }

  // timer of 60 seconds to resend otp
  void startTimer() {
    isOtpResend.value = false;
    timerSeconds.value = 60;
    countdownTimer?.cancel();
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (timerSeconds.value > 0) {
        timerSeconds.value -= 1;
      }
      if (timerSeconds.value == 0) {
        countdownTimer?.cancel();
        isOtpResend.value = true;
      }
    });
  }

  // otp varification
  varifyOtp() {
    isVarifying.value = true;
    final enteredOtp = fullOtp;
    log(enteredOtp);
    if (enteredOtp == generatedOtp) {
      Get.offAndToNamed(AppRoute.createNewPassword);
    } else {
      log('otp varification failed');
      showSnackbar('otp does not match');
    }
    isVarifying.value = false;
  }

  // resend otp
  void resendOTP() async {
    String newOTP = OtpGenerator().generateOTP();
    log('new otp =====> $newOTP');
    bool isotpSent = await OtpMail().sendOTP(email, newOTP);
    if (isotpSent && newOTP != generatedOtp) {
      generatedOtp = newOTP;
      isOtpResend.value = false;
      startTimer();
      clearOtp();
    } else {
      showSnackbar('something wents wrong, please try again');
    }
  }
}
