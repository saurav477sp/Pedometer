import 'package:flutter/material.dart';

class CircleLoading extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;
  final double? strockWidth;
  const CircleLoading({
    super.key,
    this.height = 40,
    this.width = 40,
    this.color,
    this.strockWidth = 4,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: height,
      width: width,
      child: CircularProgressIndicator(
        color: color ?? theme.colorScheme.onPrimary,
        strokeWidth: strockWidth,
      ),
    );
  }
}
