import 'package:flutter/material.dart';

class RectangleShimmer extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius? borderRadius;
  const RectangleShimmer({
    super.key,
    required this.height,
    required this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: theme.disabledColor.withOpacity(0.2),
      ),
    );
  }
}
