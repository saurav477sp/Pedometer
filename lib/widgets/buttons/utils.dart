import 'package:flutter/material.dart';
import 'package:pedometer/widgets/buttons/button_varients.dart';

Color getButtonBackgroundcolor(ThemeData theme, ButtonColorVarients varient) {
  switch (varient) {
    case ButtonColorVarients.primary:
      return theme.colorScheme.onPrimary;
    case ButtonColorVarients.secondary:
      return theme.colorScheme.tertiary;
    default:
      return theme.colorScheme.onPrimary;
  }
}

Color getButtonForGroundColor(ThemeData theme, ButtonColorVarients varient) {
  switch (varient) {
    case ButtonColorVarients.primary:
      return theme.colorScheme.onPrimaryContainer;
    case ButtonColorVarients.secondary:
      return theme.colorScheme.onTertiary;
    default:
      return theme.colorScheme.onPrimaryContainer;
  }
}
