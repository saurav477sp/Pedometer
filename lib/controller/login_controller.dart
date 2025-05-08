import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pedometer/helper/firebase_helper.dart.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  final obsecure = true.obs;
  final isLoadingSubmitting = false.obs;

  onSubmited() {
    FirebaseHelper().signinUser(emailController.text, passwordController.text);
  }
}
