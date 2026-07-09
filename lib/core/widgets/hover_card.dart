import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_decorations.dart';

/// Generic hover-lift card wrapper.
/// Wraps any child with MouseRegion + AnimatedContainer for hover elevation.
class HoverCard extends StatefulWidget {
  const HoverCard({
    super.key,
    required this.child,
    this.radius = AppDecorations.cardRadius,
    this.glowOnHover = false,
    this.glowColor = AppColors.primaryGlowColor,
    this.borderOnHover = false,
    this.padding = EdgeInsets.zero,
  });

  final Widget child;
  final double radius;
  final bool glowOnHover;
  final Color glowColor;
  final bool borderOnHover;
  final EdgeInsets padding;

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.identity()
          ..translateByDouble(0.0, _hovered ? -4.0 : 0.0, 0.0, 0.0),
        transformAlignment: Alignment.center,
        padding: widget.padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          boxShadow: _hovered && widget.glowOnHover
              ? [
                  BoxShadow(
                    color: widget.glowColor,
                    blurRadius: 32,
                    spreadRadius: -4,
                  ),
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 48,
                    offset: const Offset(0, 16),
                  ),
                ]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}
