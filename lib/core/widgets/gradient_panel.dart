import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// Glassmorphism backdrop-blur panel.
class GradientPanel extends StatelessWidget {
  const GradientPanel({
    super.key,
    required this.child,
    this.colors = AppColors.primaryGradient,
    this.radius = 22.0,
  });

  final Widget child;
  final List<Color> colors;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: colors.first.withValues(alpha: 0.35),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
        border: Border.all(
          color: colors.first.withValues(alpha: 0.2),
        ),
      ),
      child: child,
    );
  }
}
