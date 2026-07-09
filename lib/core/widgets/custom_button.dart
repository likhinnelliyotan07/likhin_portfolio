import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_decorations.dart';
import '../constants/app_text_styles.dart';

/// Premium button with hover glow effects.
/// Supports: primary gradient, outlined, accent.
class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.outlined = false,
    this.gradient = false,
    this.accent = false,
    this.light = false,
    this.small = false,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool outlined;
  final bool gradient;
  final bool accent;
  final bool light;
  final bool small;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final Color fgColor = _resolveTextColor();
    final vPad = widget.small ? 10.0 : 14.0;
    final hPad = widget.small ? 16.0 : 22.0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          transform: Matrix4.diagonal3Values(
              _hovered ? 1.025 : 1.0, _hovered ? 1.025 : 1.0, 1.0),
          transformAlignment: Alignment.center,
          decoration: _buildDecoration(),
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, color: fgColor, size: widget.small ? 15 : 17),
                SizedBox(width: widget.small ? 6 : 8),
              ],
              Text(
                widget.label,
                style: AppTextStyles.button.copyWith(
                  color: fgColor,
                  fontSize: widget.small ? 13 : 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _resolveTextColor() {
    if (widget.outlined && !widget.light) return AppColors.ink;
    if (widget.outlined && widget.light) return AppColors.ink;
    return AppColors.ink; // gradient/filled always white-ish
  }

  BoxDecoration _buildDecoration() {
    if (widget.gradient) {
      return AppDecorations.primaryGradient(
        radius: AppDecorations.buttonRadius,
      ).copyWith(
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: _hovered ? 0.5 : 0.3),
            blurRadius: _hovered ? 28 : 18,
            offset: const Offset(0, 6),
          ),
        ],
      );
    }

    if (widget.accent) {
      return AppDecorations.accentGradient(
        radius: AppDecorations.buttonRadius,
      ).copyWith(
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: _hovered ? 0.5 : 0.3),
            blurRadius: _hovered ? 28 : 18,
            offset: const Offset(0, 6),
          ),
        ],
      );
    }

    if (widget.outlined) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(AppDecorations.buttonRadius),
        border: Border.all(
          color: _hovered
              ? (widget.light ? AppColors.ink : AppColors.primaryGlow)
              : (widget.light ? AppColors.border : AppColors.border),
        ),
        color: _hovered
            ? AppColors.primary.withValues(alpha: 0.08)
            : AppColors.transparent,
      );
    }

    // Default filled
    return BoxDecoration(
      color: _hovered ? AppColors.primaryGlow : AppColors.primary,
      borderRadius: BorderRadius.circular(AppDecorations.buttonRadius),
      boxShadow: [
        BoxShadow(
          color: AppColors.primary.withValues(alpha: _hovered ? 0.4 : 0.2),
          blurRadius: _hovered ? 24 : 12,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
