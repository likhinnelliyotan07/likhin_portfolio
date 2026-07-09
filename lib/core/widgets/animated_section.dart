import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Scroll-aware reveal animation.
/// Fades in and slides up when it first enters the viewport.
/// Since Flutter's Slivers and ListViews build children lazily,
/// simply attaching .animate() handles scroll-reveals perfectly.
class RevealSection extends StatelessWidget {
  const RevealSection({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.slideOffset = 28.0,
  });

  final Widget child;
  final Duration delay;
  final double slideOffset;

  @override
  Widget build(BuildContext context) {
    return child
        .animate(delay: delay)
        .fade(duration: 650.ms, curve: Curves.easeOutCubic)
        .slideY(
          begin: slideOffset / 100,
          end: 0,
          duration: 650.ms,
          curve: Curves.easeOutCubic,
        );
  }
}

/// Simple always-playing fade-up for initial page elements (hero).
class AnimatedSection extends StatelessWidget {
  const AnimatedSection({super.key, required this.child, this.delay = 0});

  final Widget child;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return child
        .animate(delay: Duration(milliseconds: delay))
        .fade(duration: 700.ms, curve: Curves.easeOutCubic)
        .slideY(
          begin: 0.1,
          end: 0,
          duration: 700.ms,
          curve: Curves.easeOutCubic,
        );
  }
}
