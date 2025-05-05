import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontStyle fontStyle;
  final Color fontColor;
  final FontWeight fontWeight;
  final VoidCallback onPressed;
  final TextDecoration textDecoration;
  final Color textDecorationColor;
  const CustomTextButton(
      {super.key,
      required this.text,
      this.fontSize = 13,
      this.textDecorationColor = Colors.white,
      this.textDecoration = TextDecoration.none,
      this.fontStyle = FontStyle.normal,
      this.fontWeight = FontWeight.normal,
      this.fontColor = Colors.white,
      this.onPressed = _defaultFunction});

  static void _defaultFunction() {
    Get.snackbar('click', 'textbutton clicked');
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: Text(
        softWrap: true,
        textAlign: TextAlign.center,
        text,
        style: TextStyle(
          color: fontColor,
          fontSize: fontSize,
          fontStyle: fontStyle,
          fontWeight: fontWeight,
          decoration: textDecoration,
          decorationColor: textDecorationColor,
        ),
      ),
    );
  }
}
