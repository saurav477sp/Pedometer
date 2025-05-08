import 'package:flutter/material.dart';
import 'package:pedometer/widgets/text/text_style.dart';

class HeadingTextSmall extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final TextAlign textAlign;
  final AppFontFamily fontFamily;
  final FontWeight fontWeight;
  final TextDecoration? textDecoration;
  final TextOverflow? textOverflow;
  const HeadingTextSmall({
    super.key,
    required this.text,
    this.color,
    this.textOverflow,
    this.textDecoration,
    this.fontFamily = AppFontFamily.primary,
    this.textAlign = TextAlign.center,
    this.fontSize = 27,
    this.fontWeight = FontWeight.w600,
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
