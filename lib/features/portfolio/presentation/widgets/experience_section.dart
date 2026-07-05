import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/section_header.dart';
import '../../domain/entities/experience.dart';
import 'experience_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key, required this.experiences});

  final List<Experience> experiences;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: AppStrings.sectionExperience),
        const SizedBox(height: 18),
        ...experiences.map(
          (experience) => ExperienceCard(experience: experience),
        ),
      ],
    );
  }
}
