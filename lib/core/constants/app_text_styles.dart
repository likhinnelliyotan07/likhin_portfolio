import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextTheme get textTheme => TextTheme(
    displayLarge: display,
    headlineMedium: sectionTitle,
    titleLarge: title,
    titleMedium: subtitle,
    bodyLarge: body,
    bodyMedium: bodySmall,
    labelSmall: caption,
  );

  // ── Display (hero name) ────────────────────────────────────
  static TextStyle get display => GoogleFonts.inter(
    color: AppColors.ink,
    fontSize: 72,
    fontWeight: FontWeight.w800,
    height: 1.02,
    letterSpacing: -2.0,
  );

  // ── Hero tag line ──────────────────────────────────────────
  static TextStyle get hero => GoogleFonts.inter(
    color: AppColors.ink,
    fontSize: 54,
    fontWeight: FontWeight.w800,
    height: 1.04,
    letterSpacing: -1.5,
  );

  // ── Section titles (H1) ───────────────────────────────────
  static TextStyle get sectionTitle => GoogleFonts.inter(
    color: AppColors.ink,
    fontSize: 40,
    fontWeight: FontWeight.w700,
    height: 1.15,
    letterSpacing: -0.5,
  );

  // ── Card titles (H2) ──────────────────────────────────────
  static TextStyle get title => GoogleFonts.inter(
    color: AppColors.ink,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  // ── Section badge / label pill ────────────────────────────
  static TextStyle get badge => GoogleFonts.inter(
    color: AppColors.accent,
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 2.0,
  );

  // ── Subtitle / company / meta ─────────────────────────────
  static TextStyle get subtitle => GoogleFonts.inter(
    color: AppColors.primary,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  // ── Body text ─────────────────────────────────────────────
  static TextStyle get body => GoogleFonts.inter(
    color: AppColors.muted,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.7,
  );

  // ── Body small ────────────────────────────────────────────
  static TextStyle get bodySmall => GoogleFonts.inter(
    color: AppColors.muted,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.65,
  );

  // ── Caption ───────────────────────────────────────────────
  static TextStyle get caption => GoogleFonts.inter(
    color: AppColors.subtle,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3,
  );

  // ── Button label ──────────────────────────────────────────
  static TextStyle get button => GoogleFonts.inter(
    color: AppColors.ink,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  );

  // ── Nav label ─────────────────────────────────────────────
  static TextStyle get nav => GoogleFonts.inter(
    color: AppColors.muted,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  // ── Brand / logo text ─────────────────────────────────────
  static TextStyle get brand => GoogleFonts.inter(
    color: AppColors.ink,
    fontSize: 18,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
  );

  // ── Stat value (large number) ─────────────────────────────
  static TextStyle get statValue => GoogleFonts.inter(
    color: AppColors.ink,
    fontSize: 36,
    fontWeight: FontWeight.w800,
    height: 1.0,
    letterSpacing: -1.0,
  );
}
