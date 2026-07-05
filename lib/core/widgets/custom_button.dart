import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.outlined = false,
    this.gradient = false,
    this.light = false,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool outlined;
  final bool gradient;
  final bool light;

  @override
  Widget build(BuildContext context) {
    final foreground = outlined && !light ? AppColors.primary : AppColors.surface;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient
            ? const LinearGradient(colors: AppColors.contactGradient)
            : null,
        borderRadius: BorderRadius.circular(8),
        boxShadow: gradient
            ? const [BoxShadow(color: AppColors.shadow, blurRadius: 18)]
            : null,
      ),
      child: Material(
        color: outlined || gradient ? AppColors.transparent : AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: outlined
              ? (light ? AppColors.surface : AppColors.border)
              : AppColors.transparent,
        ),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) Icon(icon, color: foreground, size: 18),
                if (icon != null) const SizedBox(width: 8),
                Text(
                  label,
                  style: AppTextStyles.button.copyWith(color: foreground),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
