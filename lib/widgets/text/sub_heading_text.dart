import 'package:flutter/material.dart';
import 'package:pedometer/widgets/text/text_style.dart';

class SubHeadingText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final AppFontFamily fontFamily;
  final TextDecoration? textDecoration;
  final TextOverflow? textOverflow;
  const SubHeadingText({
    super.key,
    required this.text,
    this.color,
    this.textOverflow,
    this.textDecoration,
    this.fontFamily = AppFontFamily.primary,
    this.textAlign = TextAlign.center,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
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
