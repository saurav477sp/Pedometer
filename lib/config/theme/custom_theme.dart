import 'package:flutter/material.dart';
import 'package:pedometer/config/theme/app_color.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    // fontFamily: 'Montserrat_Alternates',
    primaryColor: lightThemeColors.primary,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      background: lightThemeColors.background,
      onBackground: lightThemeColors.onBackground,
      primary: lightThemeColors.primary,
      onPrimary: lightThemeColors.onPrimary,
      secondary: lightThemeColors.secondary,
      onSecondary: lightThemeColors.onSecondary,
      surface: lightThemeColors.surface,
      onSurface: lightThemeColors.onSurface,
      primaryContainer: lightThemeColors.primaryContainer,
      onPrimaryContainer: lightThemeColors.onPrimaryContainer,
      error: lightThemeColors.error,
      tertiary: lightThemeColors.tertiary,
      onTertiary: lightThemeColors.onTertiary
    ),
    scaffoldBackgroundColor: lightThemeColors.background,
    // textSelectionTheme: TextSelectionThemeData(
    //   cursorColor: Colors.black,
    //   selectionColor: Colors.green,
    //   selectionHandleColor: Colors.amber,
    // ),
    // popupMenuTheme: PopupMenuThemeData(
    //   color: Colors.red,
    //   textStyle: TextStyle(color: Colors.blue),

    // ),
    disabledColor: lightThemeColors.disabled.withOpacity(0.4),
  );

  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    // fontFamily: 'Montserrat_Alternates',
    primaryColor: lightThemeColors.primary,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      background: lightThemeColors.background,
      onBackground: lightThemeColors.onBackground,
      primary: lightThemeColors.primary,
      onPrimary: lightThemeColors.onPrimary,
      secondary: lightThemeColors.secondary,
      onSecondary: lightThemeColors.onSecondary,
      surface: lightThemeColors.surface,
      onSurface: lightThemeColors.onSurface,
      primaryContainer: lightThemeColors.primaryContainer,
      onPrimaryContainer: lightThemeColors.onPrimaryContainer,
      error: lightThemeColors.error,
      tertiary: lightThemeColors.tertiary,
      onTertiary: lightThemeColors.onTertiary
    ),
    scaffoldBackgroundColor: lightThemeColors.background,
    // textSelectionTheme: TextSelectionThemeData(
    //   cursorColor: Colors.black,
    //   selectionColor: Colors.green,
    //   selectionHandleColor: Colors.amber,
    // ),
    // popupMenuTheme: PopupMenuThemeData(
    //   color: Colors.red,
    //   textStyle: TextStyle(color: Colors.blue),

    // ),
    disabledColor: lightThemeColors.disabled,
  );

  // ThemeData lightTheme = ThemeData(
  //   fontFamily: 'Montserrat_Alternates',
  //   scaffoldBackgroundColor: CustomColors.primaryColor,
  //   primaryColor: CustomColors.primaryColor,
  //   colorScheme: const ColorScheme.light().copyWith(
  //       primary: CustomColors.primaryColor,
  //       onPrimary: CustomColors.onPrimaryColor,
  //       secondary: const Color(0xFFFFFFFF),
  //       onSecondary: const Color(0xFF000000),
  //       surface: CustomColors.primaryColor,
  //       error: CustomColors.primaryColor,
  //       ),
  // );
}
