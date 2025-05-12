import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/routes/app_route.dart';
import 'package:pedometer/helper/firebase_helper.dart.dart';
import 'package:pedometer/helper/local_storage_helper.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  final obsecure = true.obs;
  final isSubmitting = false.obs;

  onSubmited() async {
    isSubmitting.value = true;
    if (loginKey.currentState!.validate()) {
      final user = await FirebaseHelper().signinUser(
        emailController.text,
        passwordController.text,
      );

      if (user != null) {
        bool isStored = await LocalStorageHelper.setItem('uid', user.uid);

        if (isStored) {
          loginKey.currentState!.reset();
          emailController.clear();
          passwordController.clear();
          Get.offAllNamed(AppRoute.home);
        } else {
          log('fail to store user if in local storage');
        }
      }
    }
    isSubmitting.value = false;
  }
}
