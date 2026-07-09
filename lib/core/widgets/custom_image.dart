import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// Circular profile photo with gold ring glow.
/// Falls back to gradient initials avatar if no image.
class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.initials,
    this.imageAsset,
    this.imageUrl,
    this.size = 200,
  });

  final String initials;
  final String? imageAsset;
  final String? imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // ── Outer glow halo ─────────────────────────────────
        Container(
          width: size + 24,
          height: size + 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                AppColors.primary.withValues(alpha: 0.25),
                AppColors.transparent,
              ],
            ),
          ),
        ),
        // ── Gold ring ────────────────────────────────────────
        Container(
          width: size + 8,
          height: size + 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const SweepGradient(
              colors: [
                AppColors.accent,
                AppColors.accentAlt,
                AppColors.primary,
                AppColors.accent,
              ],
            ),
          ),
        ),
        // ── Dark gap ─────────────────────────────────────────
        Container(
          width: size + 2,
          height: size + 2,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.background,
          ),
        ),
        // ── Photo ─────────────────────────────────────────────
        Container(
          width: size,
          height: size,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: _buildImage(),
        ),
      ],
    );
  }

  Widget _buildImage() {
    if (imageAsset != null) {
      return Image.asset(imageAsset!, fit: BoxFit.cover);
    }
    if (imageUrl != null) {
      return Image.network(imageUrl!, fit: BoxFit.cover);
    }
    // ── Initials fallback ─────────────────────────────────────
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.primaryGradient,
        ),
      ),
      child: Center(
        child: Text(
          initials,
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.35,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
