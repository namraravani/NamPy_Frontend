// lib/theme/theme.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromARGB(255, 12, 165, 231); // Deep Purple
  static const Color secondary = Color.fromARGB(255, 1, 5, 20); // Teal
  static const Color background =
      Color.fromARGB(255, 255, 255, 255); // Light grey
  static const Color text = Color(0xFF000000); // Black
  static const Color danger = Color(0xFFFF5722); // Deep orange
}

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'NPFont',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontFamily: 'NPFont',
              fontSize: 30,
              letterSpacing: 1.5,
              color: AppColors
                  .primary // <-- global letter spacing for large titles
              ),

          bodyMedium: TextStyle(
              fontFamily: 'NPFont',
              letterSpacing: 1.2,
              color: AppColors.secondary,
              fontSize: 20 // <-- for body text
              ),
          // Add more if needed
        ),
      );
}
