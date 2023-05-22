import 'package:flutter/material.dart';

class ThemeConfig {
  ThemeConfig._();

  static final themeDark = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF101114),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF101114),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white60,
      ),
    ),
  );

  static final themeLight = ThemeData();
}
