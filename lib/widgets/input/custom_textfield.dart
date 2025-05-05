import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/theme/custom_colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController textEditingController;
  final double? width;
  final String hintText;
  final Color color;
  const CustomTextfield(
      {super.key,
      required this.textEditingController,
      this.width,
      this.color = CustomColors.fieldColor,
      this.hintText = 'input'});

  static Size size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? size.width * 0.9,
      alignment: Alignment.center,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
