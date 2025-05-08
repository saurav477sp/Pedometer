import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final double? size;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Border? border;
  final bool disabled;
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.disabled = false,
    this.size,
    this.backgroundColor,
    this.borderRadius,
    this.border,
  });

  double get nSize => size ?? 15;
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: InkWell(
        borderRadius: BorderRadius.circular(
          nSize / 2,
        ), // this is manage click effect in circular
        onTap: onTap,
        child: Container(
          width: nSize,
          height: nSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(nSize / 2),
            color: backgroundColor ?? Colors.transparent,
            border: border,
          ),
          child: icon,
        ),
      ),
    );
  }
}
