import 'dart:math';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class FloatingParticles extends StatefulWidget {
  final int particleCount;
  final Color color;

  const FloatingParticles({
    super.key,
    this.particleCount = 50,
    this.color = AppColors.muted,
  });

  @override
  State<FloatingParticles> createState() => _FloatingParticlesState();
}

class _FloatingParticlesState extends State<FloatingParticles>
    with SingleTickerProviderStateMixin {
  late List<_Particle> particles;
  late AnimationController _controller;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    particles = List.generate(
      widget.particleCount,
      (index) => _Particle(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        speedX: (_random.nextDouble() - 0.5) * 0.001,
        speedY: (_random.nextDouble() - 0.5) * 0.001,
        size: _random.nextDouble() * 2 + 1,
        alpha: _random.nextDouble() * 0.5 + 0.1,
      ),
    );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        for (var p in particles) {
          p.x += p.speedX;
          p.y += p.speedY;

          // Wrap around edges
          if (p.x < 0) p.x = 1.0;
          if (p.x > 1) p.x = 0.0;
          if (p.y < 0) p.y = 1.0;
          if (p.y > 1) p.y = 0.0;
        }
        setState(() {});
      });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: _ParticlePainter(particles: particles, color: widget.color),
        child: Container(),
      ),
    );
  }
}

class _Particle {
  double x, y;
  double speedX, speedY;
  double size;
  double alpha;

  _Particle({
    required this.x,
    required this.y,
    required this.speedX,
    required this.speedY,
    required this.size,
    required this.alpha,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final Color color;

  _ParticlePainter({required this.particles, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (var p in particles) {
      paint.color = color.withOpacity(p.alpha);
      canvas.drawCircle(
        Offset(p.x * size.width, p.y * size.height),
        p.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) => true;
}
