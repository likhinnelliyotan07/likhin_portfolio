import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/animated_section.dart';
import '../../../../core/widgets/section_header.dart';
import '../../domain/entities/skill_group.dart';
import 'skill_group_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key, required this.groups});

  final List<SkillGroup> groups;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Alternate background for visual rhythm
      padding: const EdgeInsets.symmetric(horizontal: 0),
      decoration: const BoxDecoration(
        color: AppColors.surfaceAlt,
      ),
      child: AnimatedSection(
        delay: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              badge: AppStrings.badgeSkills,
              title: AppStrings.sectionSkills,
              subtitle:
                  'Full-stack mobile expertise across platforms, architectures, cloud services, and delivery pipelines.',
            ),
            const SizedBox(height: 48),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: groups
                  .map((group) => SkillGroupCard(group: group))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
