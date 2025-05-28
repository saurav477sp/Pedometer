import 'package:flutter/material.dart';
import 'package:pedometer/widgets/text/text_style.dart';

class BodyTextSmall extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final TextDecoration? textDecoration;
  final TextOverflow? textOverflow;
  final FontStyle? fontStyle;
  final Color? decorationColor;
  final AppFontFamily fontFamily;
  const BodyTextSmall({
    super.key,
    required this.text,
    this.color,
    this.fontFamily = AppFontFamily.primary,
    this.decorationColor,
    this.fontStyle,
    this.textOverflow,
    this.textDecoration,
    this.textAlign = TextAlign.start,
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
        fontStyle: fontStyle,
        decorationColor: decorationColor,
      ),
      softWrap: true,
    );
  }
}
