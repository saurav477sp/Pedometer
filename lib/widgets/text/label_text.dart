import 'package:flutter/material.dart';
import 'package:pedometer/widgets/text/text_style.dart';

class LabelText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final AppFontFamily fontFamily;
  final TextDecoration? textDecoration;
  final TextOverflow? textOverflow;
  const LabelText({
    super.key,
    required this.text,
    this.color,
    this.textOverflow,
    this.fontFamily = AppFontFamily.primary,
    this.textDecoration,
    this.textAlign = TextAlign.center,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
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
