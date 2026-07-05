import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class GradientPanel extends StatelessWidget {
  const GradientPanel({super.key, required this.child, required this.colors});

  final Widget child;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: AppColors.shadow, blurRadius: 28)],
      ),
      child: child,
    );
  }
}
