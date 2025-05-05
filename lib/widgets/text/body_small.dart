import 'package:flutter/material.dart';

class BodySmall extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  const BodySmall(
      {super.key,
      required this.text,
      this.color = const Color(0xFFFFFFFF),
      this.fontSize = 15,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      softWrap: true,
    );
  }
}
