import 'package:flutter/material.dart';

class MouseFollowLighting extends StatefulWidget {
  final Widget child;
  final Color color;
  final double radius;
  final double intensity;

  const MouseFollowLighting({
    super.key,
    required this.child,
    this.color = const Color(0x334CAF50), // Subtly green/primary tint by default
    this.radius = 400,
    this.intensity = 0.5,
  });

  @override
  State<MouseFollowLighting> createState() => _MouseFollowLightingState();
}

class _MouseFollowLightingState extends State<MouseFollowLighting> {
  Offset _mousePosition = const Offset(-1000, -1000);

  void _onHover(PointerEvent event) {
    setState(() {
      _mousePosition = event.position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _onHover,
      child: Stack(
        children: [
          widget.child,
          // Lighting effect
          IgnorePointer(
            child: AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOutCubic,
              left: _mousePosition.dx - widget.radius,
              top: _mousePosition.dy - widget.radius,
              child: Container(
                width: widget.radius * 2,
                height: widget.radius * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      widget.color.withValues(alpha: widget.intensity),
                      widget.color.withValues(alpha: 0.0),
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
