import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/theme/custom_colors.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final Color color;
  final Color fontColor;
  const SubmitButton({
    super.key,
    required this.text,
    this.onClick = _defaultFunction,
    Color? color, 
    this.fontColor = Colors.white,
  }) : color = color ?? CustomColors.fieldColor;

  static void _defaultFunction() {
    Get.snackbar('button', 'button Clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.only(top: 17),
      // padding: EdgeInsets.symmetric(vertical: 15),
      width: MediaQuery.of(context).size.width * 0.9,
      child: FilledButton(
        onPressed: onClick,
        style: FilledButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(text,style: TextStyle(color: fontColor,fontSize: 17,fontWeight: FontWeight.w500),),
      ),
    );
  }
}
