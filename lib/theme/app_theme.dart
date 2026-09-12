import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF8A002E); // Bordeaux Atlas
  static const Color primaryContainer = Color(0xFFB01842);
  static const Color background = Color(0xFFFFFFFF);
  static const Color neutralBg = Color(0xFFF8FAFC);
  static const Color textPrimary = Color(0xFF0B1C30);
  static const Color textSecondary = Color(0xFF565E74);
  static const Color border = Color(0xFFE2E8F0);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primary,
      scaffoldBackgroundColor: background,
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: textPrimary),
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      useMaterial3: true,
    );
  }
}
