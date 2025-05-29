import 'package:flutter/material.dart';
import 'package:pedometer/widgets/custom_svg.dart';

class IconOrSvg extends StatelessWidget {
  final IconData? icon;
  final String iconPath;
  final Color? iconColor;
  final bool isNetwork;
  final double size;
  const IconOrSvg({
    super.key,
    this.icon,
    this.iconPath = '',
    this.isNetwork = false,
    this.iconColor,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return iconPath.isEmpty && icon != null
        ? Icon(
          icon,
          size: size,
          color: iconColor ?? theme.colorScheme.onPrimary,
        )
        : CustomSvg(
          isNetwork: isNetwork,
          svgPath: iconPath,
          color: iconColor ?? theme.colorScheme.onPrimary,
          height: size,
          width: size,
        );
  }
}
