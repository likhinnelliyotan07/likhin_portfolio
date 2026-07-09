import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';

class StatsStrip extends StatelessWidget {
  const StatsStrip({super.key});

  @override
  Widget build(BuildContext context) {
    const stats = [
      (AppStrings.years, 'Years experience'),
      ('25+', 'Production apps'),
      ('4', 'Lead roles'),
      ('3', 'Platforms'),
    ];

    return Wrap(
      spacing: 32,
      runSpacing: 24,
      children: [
        for (int i = 0; i < stats.length; i++) ...[
          _StatItem(value: stats[i].$1, label: stats[i].$2),
          if (i < stats.length - 1)
            Container(
              width: 1,
              height: 40,
              color: AppColors.border,
              margin: const EdgeInsets.symmetric(horizontal: 0),
            ),
        ],
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.value, required this.label});

  final String value;
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
          child: Text(
            value,
            style: AppTextStyles.statValue.copyWith(color: AppColors.ink),
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
