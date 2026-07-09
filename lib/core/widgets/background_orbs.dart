import 'dart:math';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class BackgroundOrbs extends StatefulWidget {
  const BackgroundOrbs({super.key});

  @override
  State<BackgroundOrbs> createState() => _BackgroundOrbsState();
}

class _BackgroundOrbsState extends State<BackgroundOrbs>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final val = _controller.value;
          final size = MediaQuery.sizeOf(context);

          return Stack(
            children: [
              // Purple Orb
              Positioned(
                top: size.height * 0.1 + (sin(val * pi) * 50),
                left: size.width * 0.1 + (cos(val * pi) * 50),
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primary.withValues(alpha: 0.15),
                        AppColors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              // Gold Orb
              Positioned(
                bottom: size.height * 0.1 + (cos(val * pi) * 50),
                right: size.width * 0.1 + (sin(val * pi) * 50),
                child: Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.accent.withValues(alpha: 0.1),
                        AppColors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
