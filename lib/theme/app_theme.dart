import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Brand Colors
  static const Color brandBlue = Color(0xFF17389A);
  static const Color brandDarkNavy = Color(0xFF0F1E5C);
  static const Color brandNavyHeader = Color(0xFF1E2652);
  static const Color brandOrange = Color(0xFFF15A24);
  static const Color brandAmber = Color(0xFFD9822B);
  static const Color brandGreen = Color(0xFF22C55E);
  static const Color brandGreenDark = Color(0xFF16A34A);
  static const Color brandPurple = Color(0xFF7C3AED);
  static const Color brandTeal = Color(0xFF00BFA5);
  static const Color brandRed = Color(0xFFEF4444);

  // Backgrounds & Surfaces
  static const Color background = Color(0xFFF8FAFC);
  static const Color cardBg = Colors.white;
  static const Color mapBg = Color(0xFFF3F5F9);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF4B5563);
  static const Color textMuted = Color(0xFF9CA3AF);
  static const Color textLight = Colors.white;

  // Status & Badges
  static const Color approvedBg = Color(0xFFDCFCE7);
  static const Color approvedText = Color(0xFF166534);
  static const Color rejectedBg = Color(0xFFFEE2E2);
  static const Color rejectedText = Color(0xFF991B1B);
  static const Color pendingBg = Color(0xFFFEF3C7);
  static const Color pendingText = Color(0xFF92400E);
  static const Color activeBlue = Color(0xFF1D4ED8);
}

class AppTheme {
  static ThemeData get theme {
    final baseTextTheme = GoogleFonts.interTextTheme();
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.brandBlue,
        primary: AppColors.brandBlue,
        secondary: AppColors.brandOrange,
        surface: AppColors.cardBg,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: baseTextTheme.copyWith(
        headlineLarge: GoogleFonts.inter(
          fontSize: 26,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimary,
          height: 1.25,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
          height: 1.3,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
          height: 1.45,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
          height: 1.4,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 1,
      ),
    );
  }
}
