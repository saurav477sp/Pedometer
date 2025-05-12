import 'dart:developer';

import 'package:get/get.dart';
import 'package:pedometer/config/routes/app_route.dart';

class PasswordChangedUiController extends GetxController {
  String email = '';
  String password = '';

  getPassedData() {
    String? email = Get.parameters['email'];
    String? password = Get.parameters['password'];
    log('passed email ======> $email, passed password =====> $password');
    if (email != null && password != null) {
      this.email = email;
      this.password = password;
      log(
        'stored email ======> ${this.email}, stored password =====> ${this.password}',
      );
    } else {
      log('did not get stored details');
    }
  }

  init() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed(AppRoute.home),
    );
  }
}