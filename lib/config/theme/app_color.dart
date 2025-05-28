import 'package:flutter/services.dart';

class AppColor {
  // background
  final Color background;
  final Color onBackground;
  final Color tertiary;
  final Color onTertiary;

  // primary color
  final Color primary;
  final Color onPrimary;

  // secondary color
  final Color secondary;
  final Color onSecondary;

  // surface
  final Color surface;
  final Color onSurface;

  // text
  // final Color primaryText;
  // final Color secondaryText;

  // buttons
  // final Color accent;
  // final Color onAccent;
  // final Color surfaceVarient;
  // final Color onSurfaceVarient;
  final Color primaryContainer;
  final Color onPrimaryContainer;

  // utility
  final Color disabled;
  final Color error;
  final Color success;
  final Color warning;

  AppColor({
    required this.background,
    required this.onBackground,
    required this.tertiary,
    required this.onTertiary,
    required this.primary,
    required this.onPrimary,
    required this.surface,
    required this.onSurface,
    // required this.primaryText,
    // required this.secondaryText,
    // required this.accent,
    // required this.onAccent,
    // required this.surfaceVarient,
    // required this.onSurfaceVarient,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.disabled,
    required this.error,
    required this.success,
    required this.warning,
    required this.secondary,
    required this.onSecondary,
  });
}

var lightThemeColors = AppColor(
  background: const Color(0xFF6b8c75),
  onBackground: const Color(0xFFFFFFFF),
  primary: const Color(0xFF6b8c75),
  onPrimary: const Color(0xFFFFFFFF),
  secondary: const Color(0xFFF5F2B8),
  onSecondary: const Color(0xFF56705e),
  surface: const Color(0xFFFFFFFF),
  onSurface: const Color(0xFF56705e),
  primaryContainer: const Color(0xFFE8E8E8),
  onPrimaryContainer: const Color(0xFF000000),
  error: const Color(0xFFad0d0d),
  disabled: const Color(0xFF908E98),
  success: const Color(0xFF138808),
  warning: const Color(0xFFFFC107),
  tertiary: const Color(0xFF56705e),
  onTertiary: const Color(0xFFFFFFFF),
);

// var darkThemeColors = AppColor(
//   background: const Color(0xFF6b8c75),
//   onBackground: const Color(0xFFFFFFFF),
//   primary: const Color(0xFF6b8c75),
//   onPrimary: const Color(0xFFFFFFFF),
//   secondary: const Color(0xFFF5F2B8),
//   onSecondary: const Color(0xFF56705e),
//   surface: const Color(0xFF6b8c75),
//   onSurface: const Color(0xFFFFFFFF),
//   primaryContainer: const Color(0xFFE8E8E8),
//   onPrimaryContainer: const Color(0xFF000000),
//   error: const Color(0xFFcc4545),
//   disabled: const Color(0xFF646053),
//   success: const Color(0xFF138808),
//   warning: const Color(0xFFFFC107),
//   tertiary: const Color(0xFF56705e),
//   onTertiary: const Color(0xFFFFFFFF),
// );




class colrs {
  static const Color pink = Color(0xFFFFC9E9);
  static const Color grey = Color(0xFFD7D7D7);
}