import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary        = Color(0xFF0288D1);
  static const Color primaryDark    = Color(0xFF0277BD);
  static const Color primaryMid     = Color(0xFF029BE5);
  static const Color primaryLight   = Color(0xFF29B6F6);
  static const Color primaryLighter = Color(0xFF4FC3F7);
  static const Color primaryPale    = Color(0xFFB3E5FC);
  static const Color primarySoft    = Color(0xFFE1F5FE);
  static const Color accent         = Color(0xFF29B6F6);

  static const Color success     = Color(0xFF16A34A);
  static const Color successSoft = Color(0xFFDCFCE7);

  static const Color warning     = Color(0xFFFFB300);
  static const Color warningSoft = Color(0xFFFFF8E1);

  static const Color danger     = Color(0xFFDC2626);
  static const Color dangerSoft = Color(0xFFFEE2E2);

  static const Color info     = Color(0xFF0288D1);
  static const Color infoSoft = Color(0xFFE1F5FE);

  static const Color bg      = Color(0xFFF0F9FF);
  static const Color surface = Colors.white;
  static const Color border  = Color(0xFFBBDEFB);

  static const Color text      = Color(0xFF01579B);
  static const Color textMuted = Color(0xFF78909C);
  static const Color textDark  = Color(0xFF1A237E);
}

class AppTheme {
  static const SystemUiOverlayStyle lightOverlay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.primaryDark, AppColors.primary, AppColors.primaryLight],
  );

  static ThemeData light() {
    final base = ThemeData.light(useMaterial3: true);

    final textTheme = GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: AppColors.text,
      displayColor: AppColors.text,
    );

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: Colors.white,
        primaryContainer: AppColors.primarySoft,
        onPrimaryContainer: AppColors.text,
        secondary: AppColors.primaryLight,
        onSecondary: Colors.white,
        secondaryContainer: AppColors.primaryPale,
        onSecondaryContainer: AppColors.text,
        surface: AppColors.surface,
        onSurface: AppColors.text,
        error: AppColors.danger,
        onError: Colors.white,
      ),
      textTheme: textTheme,

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        systemOverlayStyle: lightOverlay,
        titleTextStyle: textTheme.titleMedium?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.border),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.bg,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.textMuted,
          fontSize: 14,
        ),
        labelStyle: textTheme.bodySmall?.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryDark,
          letterSpacing: 0.3,
        ),
        prefixIconColor: AppColors.primary,
        iconColor: AppColors.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: AppColors.primaryLight.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.danger, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.danger, width: 2),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.primary.withOpacity(0.6),
          elevation: 8,
          minimumSize: const Size.fromHeight(54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          minimumSize: const Size.fromHeight(46),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      chipTheme: base.chipTheme.copyWith(
        backgroundColor: AppColors.primarySoft,
        labelStyle: textTheme.labelMedium?.copyWith(
          color: AppColors.primaryDark,
          fontWeight: FontWeight.w600,
        ),
        side: BorderSide.none,
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? AppColors.primary
              : null,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: BorderSide(color: Colors.grey.shade400, width: 1.5),
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.primarySoft,
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),

      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.primaryDark,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
        contentTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}