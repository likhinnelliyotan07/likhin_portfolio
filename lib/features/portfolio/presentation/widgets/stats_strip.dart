import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class StatsStrip extends StatelessWidget {
  const StatsStrip({super.key});

  @override
  Widget build(BuildContext context) {
    const stats = [
      (9, '+', 'Years experience'),
      (25, '+', 'Production apps'),
      (4, '', 'Lead roles'),
      (3, '', 'Platforms'),
    ];

    return Wrap(
      spacing: 32,
      runSpacing: 24,
      children: [
        for (int i = 0; i < stats.length; i++) ...[
          _StatItem(
            value: stats[i].$1,
            suffix: stats[i].$2,
            label: stats[i].$3,
          )
          .animate(delay: Duration(milliseconds: 100 * i))
          .fade(duration: 600.ms, curve: Curves.easeOut)
          .slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic),
          if (i < stats.length - 1)
            Container(
              width: 1,
              height: 40,
              color: AppColors.border,
              margin: const EdgeInsets.symmetric(horizontal: 0),
            )
            .animate(delay: Duration(milliseconds: 100 * i + 50))
            .fade(duration: 600.ms),
        ],
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.value,
    required this.suffix,
    required this.label,
  });

  final int value;
  final String suffix;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppColors.ink, AppColors.primaryGlow],
          ).createShader(bounds),
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: value.toDouble()),
            duration: const Duration(seconds: 2),
            curve: Curves.easeOutCubic,
            builder: (context, val, child) {
              return Text(
                '${val.toInt()}$suffix',
                style: AppTextStyles.statValue.copyWith(color: AppColors.ink),
              );
            },
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.caption,
        ),
      ],
    );
  }
}
