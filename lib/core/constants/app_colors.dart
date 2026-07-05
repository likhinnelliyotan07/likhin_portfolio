import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  // Backgrounds
  static const background = Color(0xFFF7FAFC);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceAlt = Color(0xFFEAF6FF);

  // Brand Colors
  static const primary = Color(0xFF2196F3); // Light Blue
  static const secondary = Color(0xFF64B5F6); // Sky Blue
  static const accent = Color(0xFFE53935); // Red

  // Text
  static const ink = Color(0xFF1F2937);
  static const muted = Color(0xFF6B7280);

  // Border
  static const border = Color(0xFFD6E4F0);

  // Status
  static const success = Color(0xFF2E7D32);
  static const danger = Color(0xFFD32F2F);

  static const transparent = Colors.transparent;
  static const shadow = Color(0x1A000000);

  // Hero Gradient
  static const heroGradient = [
    Color(0xFFE3F2FD), // Very Light Blue
    Color(0xFF90CAF9), // Light Blue
    Color(0xFFFFEBEE), // Very Light Red
  ];

  // Contact Gradient
  static const contactGradient = [
    Color(0xFF42A5F5), // Blue
    Color(0xFF64B5F6), // Sky Blue
    Color(0xFFE53935), // Red
  ];
}