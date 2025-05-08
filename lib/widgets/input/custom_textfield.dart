import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController textEditingController;
  final double? width;
  final String hintText;
  final Color? color;
  final String? Function(String?)? validator;
  const CustomTextfield({
    super.key,
    required this.textEditingController,
    this.width,
    this.color,
    this.hintText = '',
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width ?? size.width * 0.9,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? Get.theme.colorScheme.tertiary,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          // hintStyle: TextStyle(fontFamily: ),
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
        ),
        validator: validator,
      ),
    );
  }
}
