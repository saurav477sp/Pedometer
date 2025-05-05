import 'package:flutter/material.dart';

class BodyBig extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  const BodyBig(
      {super.key,
      required this.text,
      this.color = const Color(0xFFFFFFFF),
      this.fontSize = 35});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color, fontSize: fontSize, fontWeight: FontWeight.w600,),
      softWrap: true,
    );
  }
}
