import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  // ── Backgrounds ──────────────────────────────────────────
  static const background = Color(0xFF0A0A0F);
  static const surface = Color(0xFF111118);
  static const surfaceAlt = Color(0xFF16161F);
  static const surfaceGlass = Color(0x0AFFFFFF); // 4% white

  // ── Brand ─────────────────────────────────────────────────
  static const primary = Color(0xFF6C63FF); // electric indigo
  static const primaryGlow = Color(0xFF8B83FF); // hover/glow
  static const accent = Color(0xFFC9A96E); // warm gold (from LN logo)
  static const accentAlt = Color(0xFFE8C98A); // lighter gold shimmer

  // ── Text ──────────────────────────────────────────────────
  static const ink = Color(0xFFF0F0F8); // near-white headings
  static const muted = Color(0xFF8B8BA7); // body / secondary
  static const subtle = Color(0xFF3D3D55); // dividers / disabled

  // ── Border ────────────────────────────────────────────────
  static const border = Color(0x14FFFFFF); // 8% white
  static const borderHover = Color(0x29FFFFFF); // 16% white on hover

  // ── Status ────────────────────────────────────────────────
  static const success = Color(0xFF22D3A0);
  static const danger = Color(0xFFFF5F7E);

  // ── Utility ───────────────────────────────────────────────
  static const transparent = Colors.transparent;
  static const shadow = Color(0x66000000); // 40%

  // ── Gradients ─────────────────────────────────────────────
  static const heroGradient = [
    Color(0xFF0A0A0F),
    Color(0xFF1A1040),
    Color(0xFF0A0A0F),
  ];

  static const primaryGradient = [Color(0xFF6C63FF), Color(0xFF9B8FFF)];

  static const accentGradient = [Color(0xFFC9A96E), Color(0xFFE8C98A)];

  static const contactGradient = [
    Color(0xFF6C63FF),
    Color(0xFF9B8FFF),
    Color(0xFFC9A96E),
  ];

  // ── Glow Colors ───────────────────────────────────────────
  static const primaryGlowColor = Color(0x266C63FF); // 15% indigo
  static const accentGlowColor = Color(0x26C9A96E); // 15% gold
}
