import 'package:flutter/material.dart';
import 'package:pedometer/config/theme/custom_colors.dart';

class CustomTheme {
  ThemeData lightTheme = ThemeData(
    fontFamily: 'Montserrat_Alternates',
    scaffoldBackgroundColor: CustomColors.primaryColor,
    primaryColor: CustomColors.primaryColor,
    colorScheme: const ColorScheme.light().copyWith(
        primary: CustomColors.primaryColor,
        onPrimary: CustomColors.primarydarkColor,
        secondary: const Color(0xFFFFFFFF),
        onSecondary: const Color(0xFF000000),
        surface: CustomColors.primaryColor,
        error: CustomColors.primaryColor,
        ),
  );
  ThemeData darkTheme = ThemeData.dark().copyWith(
      // primaryColor: Color(0xFF312a3e),
      // colorScheme: ColorScheme.light().copyWith(
      //   primary: Color(0xFF312a3e),
      //   onPrimary: Color(0xFFe6e5e7),
      //   secondary: Color(0xFFd6ebeb),
      //   onSecondary: Color(0xFF282337),
      //   surface: Color(0xFF312a3e),
      // ),
      );
}
