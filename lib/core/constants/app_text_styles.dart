import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextTheme get textTheme => TextTheme(
    displayLarge: hero,
    headlineMedium: sectionTitle,
    titleLarge: title,
    titleMedium: subtitle,
    bodyLarge: body,
    bodyMedium: bodySmall,
  );

  static TextStyle get hero => TextStyle(
    color: AppColors.ink,
    fontSize: 54.sp.clamp(34, 64),
    fontWeight: FontWeight.w800,
    height: 1.04,
  );

  static TextStyle get sectionTitle => TextStyle(
    color: AppColors.ink,
    fontSize: 30.sp.clamp(24, 36),
    fontWeight: FontWeight.w800,
  );

  static TextStyle get title => TextStyle(
    color: AppColors.ink,
    fontSize: 22.sp.clamp(18, 26),
    fontWeight: FontWeight.w700,
  );

  static TextStyle get subtitle => TextStyle(
    color: AppColors.primary,
    fontSize: 16.sp.clamp(14, 18),
    fontWeight: FontWeight.w700,
  );

  static TextStyle get body => TextStyle(
    color: AppColors.muted,
    fontSize: 16.sp.clamp(14, 18),
    height: 1.55,
  );

  static TextStyle get bodySmall => TextStyle(
    color: AppColors.muted,
    fontSize: 14.sp.clamp(12, 16),
    height: 1.45,
  );

  static TextStyle get button => TextStyle(
    color: AppColors.surface,
    fontSize: 14.sp.clamp(12, 16),
    fontWeight: FontWeight.w700,
  );
}
