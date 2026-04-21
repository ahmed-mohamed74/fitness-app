import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    // fontFamily: 'Poppins',
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 30,
        color: Colors.white,
      ),
    ),
    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ThemeData.dark().primaryColor,
      unselectedItemColor: ThemeData().colorScheme.surface,
      backgroundColor: ThemeData().scaffoldBackgroundColor,
    ),
  );
  static ThemeData lightTheme = appTheme.copyWith();

  static ThemeData darkTheme = appTheme.copyWith(
    /// 🎨 COLORS
    primaryColor: Color(0xFF007FFF),
    scaffoldBackgroundColor: const Color(0xFF0D1117),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF007FFF),
      secondary: Colors.white,
      surface: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
    ),
  );
}
