import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/section_header.dart';
import '../../domain/entities/skill_group.dart';
import 'skill_group_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key, required this.groups});

  final List<SkillGroup> groups;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: AppStrings.sectionSkills),
        const SizedBox(height: 18),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: groups
              .map((group) => SkillGroupCard(group: group))
              .toList(),
        ),
      ],
    );
  }
}
