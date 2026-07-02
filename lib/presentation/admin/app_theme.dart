import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color primary       = Color(0xFF0288D1);
  static const Color primaryDark   = Color(0xFF01579B);
  static const Color primaryLight  = Color(0xFF29B6F6);
  static const Color primarySoft   = Color(0xFFE1F5FE);
  static const Color success       = Color(0xFF2E7D32);
  static const Color successSoft   = Color(0xFFE8F5E9);
  static const Color warning       = Color(0xFFF57F17);
  static const Color warningSoft   = Color(0xFFFFF8E1);
  static const Color danger        = Color(0xFFC62828);
  static const Color dangerSoft    = Color(0xFFFFEBEE);
  static const Color info          = Color(0xFF01579B);
  static const Color infoSoft      = Color(0xFFE3F2FD);
  static const Color accent        = Color(0xFF6A1B9A);
  static const Color accentSoft    = Color(0xFFF3E5F5);
  static const Color surface       = Color(0xFFFFFFFF);
  static const Color bg            = Color(0xFFF0F9FF);
  static const Color border        = Color(0xFFE8F4FD);
  static const Color text          = Color(0xFF1A237E);
  static const Color textMuted     = Color(0xFF90A4AE);
}

class AppTheme {
  AppTheme._();

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [AppColors.primaryDark, AppColors.primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static ThemeData get theme => ThemeData(
    colorSchemeSeed: AppColors.primary,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.bg,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.text,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.text, fontSize: 17, fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(color: AppColors.primary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.bg,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      hintStyle: const TextStyle(color: AppColors.textMuted, fontSize: 13),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: const Size.fromHeight(46),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surface,
      selectedColor: AppColors.primary,
      side: const BorderSide(color: AppColors.border),
      labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    ),
  );
}








