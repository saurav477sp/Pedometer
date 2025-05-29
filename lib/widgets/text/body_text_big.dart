import 'package:flutter/material.dart';
import 'package:pedometer/widgets/text/text_style.dart';

class BodyTextBig extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final TextDecoration? textDecoration;
  final AppFontFamily fontFamily;
  final TextOverflow? textOverflow;
  const BodyTextBig({
    super.key,
    this.fontWeight = FontWeight.w600,
    required this.text,
    this.color,
    this.fontFamily = AppFontFamily.primary,
    this.textOverflow,
    this.textDecoration,
    this.textAlign = TextAlign.center,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? theme.colorScheme.onPrimary,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily.toValues(),
        decoration: textDecoration,
        overflow: textOverflow,
      ),
      softWrap: true,
    );
  }
}
