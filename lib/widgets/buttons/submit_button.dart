import 'package:flutter/material.dart';
import 'package:pedometer/widgets/text/body_text_small.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final Color? color;
  final Color? fontColor;
  final double height;
  const SubmitButton({
    super.key,
    this.height = 58,
    required this.text,
    required this.onClick,
    this.color,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: 55,
      margin: const EdgeInsets.only(top: 17),
      // padding: EdgeInsets.symmetric(vertical: 15),
      width: MediaQuery.of(context).size.width * 0.9,
      child: FilledButton(
        onPressed: onClick,
        style: FilledButton.styleFrom(
          backgroundColor: color ?? theme.colorScheme.primaryContainer,
        ),
        child: BodyTextSmall(
          text: text,
          fontSize: 17,
          textAlign: TextAlign.center,
          color: fontColor ?? theme.colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
