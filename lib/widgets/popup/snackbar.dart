import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/widgets/text/label_text.dart';

class CustomSnackbar {
  static void showSnackbar(String title, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.snackbar(title, message);
    });
  }
}

showSnackbar(
  String message, {
  EdgeInsets? padding,
  EdgeInsets? margin,
  TextAlign textAlign = TextAlign.center,
  Color? backgroundColor,
  Color? fontColor,
  FontWeight? fontWeight,
  Color? borderColor,
  Duration animationDuration = const Duration(seconds: 1),
  Duration duration = const Duration(milliseconds: 1500),
  double borderWidth = 0.5,
  SnackPosition snackPosition = SnackPosition.BOTTOM,
  double borderRadius = 10,
  bool isDismissable = true,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Get.rawSnackbar(
      animationDuration: animationDuration,
      backgroundColor:
          backgroundColor ?? Get.theme.colorScheme.tertiary.withOpacity(0.7),
      barBlur: 4,
      borderColor: borderColor ?? Get.theme.colorScheme.onTertiary,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      snackPosition: snackPosition,
      duration: duration,
      margin: margin ?? EdgeInsets.fromLTRB(15, 0, 15, 25),
      messageText: LabelText(
        text: message,
        textAlign: textAlign,
        color: fontColor,
        fontWeight: fontWeight,
        fontSize: 16,
      ),
      padding: padding ?? EdgeInsets.all(10),
      isDismissible: isDismissable,
    );
  });
}
