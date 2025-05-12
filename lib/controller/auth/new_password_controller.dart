import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/routes/app_route.dart';
import 'package:pedometer/widgets/popup/snackbar.dart';

class NewPasswordController extends GetxController {
  String email = '';
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();

  final newPassKey = GlobalKey<FormState>();

  RxBool isPassObsecure = true.obs;
  RxBool isConformPassObsecure = true.obs;

  RxBool isSubmitting = false.obs;

  getPassedData() {
    String? email = Get.parameters['email'];
    log(email.toString());
    if (email != null) {
      this.email = email;
      log('stored email ===========> ${this.email}');
    } else {
      log(' error ===========> email not found in passed data');
    }
  }

  onSubmit() async {
    if (newPassKey.currentState!.validate()) {
      isSubmitting.value = true;

      // logic to cahnge pass
      showSnackbar('password is changed');
      log(
        'firebase only allow email reset link to dorgot password but i am not using it',
      );
      Get.toNamed(
        AppRoute.passChangedSucces,
        parameters: {'email': email, 'password': passwordController.text},
      );
    }
    isSubmitting.value = false;
  }
}
