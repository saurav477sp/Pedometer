import 'package:flutter/material.dart';

class CircleLoading extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;
  const CircleLoading({
    super.key,
    this.height = 40,
    this.width = 40,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: height,
      width: width,
      child: CircularProgressIndicator(
        color: color ?? theme.colorScheme.onPrimary,
        strokeWidth: 4,
      ),
    );
  }
}
