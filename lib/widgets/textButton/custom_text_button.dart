import 'package:flutter/material.dart';
import 'package:pedometer/widgets/text/body_text_small.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontStyle? fontStyle;
  final Color? fontColor;
  final FontWeight fontWeight;
  final VoidCallback? onPressed;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  const CustomTextButton({
    super.key,
    required this.text,
    this.fontSize = 13,
    this.textDecorationColor,
    this.textDecoration,
    this.fontStyle,
    this.fontWeight = FontWeight.normal,
    this.fontColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: BodyTextSmall(
        text: text,
        color: fontColor ?? theme.colorScheme.onPrimary,
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        textDecoration: textDecoration,
        decorationColor: textDecorationColor,
      ),
    );
  }
}
