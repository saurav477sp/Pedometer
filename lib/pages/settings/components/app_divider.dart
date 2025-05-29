import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double? indent;
  final Color? color;
  final double height;
  final double thickNess;
  const AppDivider({
    super.key,
    this.indent = 20,
    this.color,
    this.height = 1,
    this.thickNess = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Divider(
      color: color ?? theme.colorScheme.onPrimary.withOpacity(0.7),
      endIndent: indent,
      height: height,
      indent: indent,
      thickness: thickNess,
    );
  }
}
