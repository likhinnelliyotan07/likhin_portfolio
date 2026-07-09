import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Scroll-aware reveal animation.
/// Fades in and slides up when it first enters the viewport.
class RevealSection extends StatefulWidget {
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
  State<RevealSection> createState() => _RevealSectionState();
}

class _RevealSectionState extends State<RevealSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;

  bool _triggered = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    );
    _opacity = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
    _slide = Tween<Offset>(
      begin: Offset(0, widget.slideOffset / 100),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _trigger() {
    if (_triggered) return;
    _triggered = true;
    if (widget.delay == Duration.zero) {
      _ctrl.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _ctrl.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (_) {
        _checkVisibility();
        return false;
      },
      child: Builder(
        builder: (ctx) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _checkVisibility();
          });
          return FadeTransition(
            opacity: _opacity,
            child: SlideTransition(position: _slide, child: widget.child),
          );
        },
      ),
    );
  }

  void _checkVisibility() {
    if (_triggered) return;
    final renderObj = context.findRenderObject();
    if (renderObj == null) return;
    final viewport = RenderAbstractViewport.of(renderObj);
    final offset = viewport.getOffsetToReveal(renderObj, 0.0).offset;
    final scrollable = Scrollable.of(context);
    final scrollPos = scrollable.position.pixels;
    final viewportHeight = scrollable.position.viewportDimension;
    if (scrollPos + viewportHeight > offset + 80) {
      _trigger();
    }
  }
}

/// Simple always-playing fade-up for initial page elements (hero).
class AnimatedSection extends StatelessWidget {
  const AnimatedSection({super.key, required this.child, this.delay = 0});

  final Widget child;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 700 + delay),
      curve: Curves.easeOutCubic,
      child: child,
      builder: (_, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(0, 28 * (1 - value)),
          child: child,
        ),
      ),
    );
  }
}
