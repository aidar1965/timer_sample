import 'package:flutter/material.dart';
import 'package:timer_sample/app/themes/theme_constants.dart';

class CustomTheme {
  static ThemeData customLightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryLight,
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: primaryLight),
    dividerColor: Colors.black,
  );

  static ThemeData customDarkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black45,
    appBarTheme: const AppBarTheme(backgroundColor: primaryDark),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryDark, foregroundColor: Colors.white),
    dividerColor: Colors.white,
  );

  ThemeData get lightTheme => customLightTheme;
  ThemeData get darkTheme => customDarkTheme;
}
