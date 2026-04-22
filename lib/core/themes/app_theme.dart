import 'package:flutter/material.dart';

class AppTheme {
  // 1. Define your brand's main color
  static const primaryColor = Color(0xFF007FFF);

  // 2. LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
      titleMedium: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
      bodyMedium: TextStyle(fontSize: 16),
    ),
    colorScheme: ColorScheme.fromSeed(
      primary: primaryColor,
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),
    // Shared styling for the bottom bar
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      type: BottomNavigationBarType.fixed,
    ),
  );

  // 3. DARK THEME
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 30,
        overflow: TextOverflow.ellipsis,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        overflow: TextOverflow.ellipsis,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        overflow: TextOverflow.ellipsis,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        overflow: TextOverflow.ellipsis,
      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      primary: primaryColor,
      seedColor: primaryColor,
      brightness:
          Brightness.dark, // This tells Flutter to use white text automatically
      surface: const Color(
        0xFF0D1117,
      ), // Optional: your specific dark background
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
