import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/routes/app_route.dart';
import 'package:pedometer/helper/firebase_database_helper.dart';
import 'package:pedometer/helper/firebase_helper.dart.dart';
import 'package:pedometer/helper/local_storage_helper.dart';
import 'package:pedometer/widgets/popup/snackbar.dart';

class RegistrationController extends GetxController {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  final registrationKey = GlobalKey<FormState>();

  final passwordObsecure = true.obs;
  final rePasswordObSecure = true.obs;
  final isProcessing = false.obs;

  onSubmit() async {
    if (registrationKey.currentState!.validate()) {
      isProcessing.value = true;
      User? user = await FirebaseHelper().signUpwithEmailandPassword(
        email: emailController.text,
        password: passwordController.text,
        userName: userNameController.text,
      );

      if (user != null) {
        bool isStored = await LocalStorageHelper.setItem('uid', user.uid);
        if (!isStored) {
          FirebaseHelper().deleteCurrentUser();
          FirebaseDatabaseHelper().deleteUserDetails(user.uid);
          log('fail to stored uid in stored preferences');
          showSnackbar('please try again');
        } else {
          registrationKey.currentState!.reset();
          userNameController.clear();
          emailController.clear();
          passwordController.clear();
          rePasswordController.clear();
          Get.offAllNamed(AppRoute.home);
        }
      }
    }
    isProcessing.value = false;
  }
}
