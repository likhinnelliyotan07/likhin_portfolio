import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Shared decoration helpers — 8-pt system, premium dark
class AppDecorations {
  const AppDecorations._();

  // ── Card radius constants ──────────────────────────────────
  static const double cardRadius = 22;
  static const double chipRadius = 12;
  static const double buttonRadius = 12;
  static const double badgeRadius = 100;

  // ── Standard card ─────────────────────────────────────────
  static BoxDecoration card({
    Color? color,
    double radius = cardRadius,
    bool glow = false,
    Color glowColor = AppColors.primaryGlowColor,
  }) {
    return BoxDecoration(
      color: color ?? AppColors.surface,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: AppColors.border),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadow,
          blurRadius: 40,
          offset: const Offset(0, 8),
        ),
        if (glow)
          BoxShadow(
            color: glowColor,
            blurRadius: 32,
            spreadRadius: -4,
          ),
      ],
    );
  }

  // ── Glassmorphism card ────────────────────────────────────
  static BoxDecoration glass({
    double radius = cardRadius,
    bool glowBorder = false,
  }) {
    return BoxDecoration(
      color: AppColors.surfaceGlass,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        color: glowBorder ? AppColors.primary.withValues(alpha: 0.3) : AppColors.border,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadow,
          blurRadius: 40,
          offset: const Offset(0, 8),
        ),
      ],
    );
  }

  // ── Section badge pill ────────────────────────────────────
  static BoxDecoration badge() => BoxDecoration(
    color: AppColors.accent.withValues(alpha: 0.12),
    borderRadius: BorderRadius.circular(badgeRadius),
    border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)),
  );

  // ── Primary gradient decoration ───────────────────────────
  static BoxDecoration primaryGradient({double radius = buttonRadius}) =>
      BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.primaryGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      );

  // ── Accent gradient decoration ────────────────────────────
  static BoxDecoration accentGradient({double radius = buttonRadius}) =>
      BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.accentGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      );
}
