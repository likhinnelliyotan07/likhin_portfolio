import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/entities/skill_group.dart';
import 'skill_chip.dart';

class SkillGroupCard extends StatelessWidget {
  const SkillGroupCard({super.key, required this.group});

  final SkillGroup group;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(group.title, style: AppTextStyles.subtitle),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: group.skills
                .map((skill) => SkillChip(label: skill))
                .toList(),
          ),
        ],
      ),
    );
  }
}
