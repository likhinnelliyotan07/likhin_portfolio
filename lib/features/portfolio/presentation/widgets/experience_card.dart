import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/entities/experience.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key, required this.experience});

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(experience.role, style: AppTextStyles.title),
          const SizedBox(height: 4),
          Text(
            '${experience.company} | ${experience.period} | ${experience.location}',
            style: AppTextStyles.subtitle,
          ),
          const SizedBox(height: 12),
          ...experience.points.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text('- $point', style: AppTextStyles.body),
            ),
          ),
        ],
      ),
    );
  }
}
