import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
static void showSnackbar(String title, String message) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Get.snackbar(title, message);
  });
}
}