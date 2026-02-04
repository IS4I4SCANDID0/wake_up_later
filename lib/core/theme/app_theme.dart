import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryLightColor = Color(0xFFB3E5FF);
  static const Color primaryDarkColor = Color(0xFF1A3D66);
  // static const Color accentButton = Color(0XFFFFA500);
  static const Color textLightColor = Color(0XFF0a0a0a);
  static const Color textDarkColor = Color(0XFFfafafa);
  static const Color accentSwitchIcon = Color.fromARGB(255, 247, 132, 32);
}

// Contrato de temas para o aplicativo (princíopios de SOLID)
class AppTheme {
  static const String _fontFamily = 'Montserrat';
  // Tema claro
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: _fontFamily,
      colorSchemeSeed: AppColors.primaryLightColor,
      scaffoldBackgroundColor: AppColors.primaryLightColor,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w800,
          fontFamily: _fontFamily,
        ),
      ),
    );
  }

  // Tema escuro
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: _fontFamily,
      colorSchemeSeed: AppColors.primaryDarkColor,
      scaffoldBackgroundColor: AppColors.primaryDarkColor,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w800,
          fontFamily: _fontFamily,
        ),
      ),
    );
  }
}
