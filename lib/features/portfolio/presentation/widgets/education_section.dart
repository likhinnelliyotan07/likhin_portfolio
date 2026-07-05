import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/section_header.dart';
import '../../domain/entities/education.dart';
import 'info_list_card.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({
    super.key,
    required this.education,
    required this.certifications,
    required this.achievements,
  });

  final List<Education> education;
  final List<String> certifications;
  final List<String> achievements;

  @override
  Widget build(BuildContext context) {
    final educationItems = education
        .map(
          (item) =>
              '${item.degree}, ${item.institute} (${item.year})${item.detail == null ? '' : ' - ${item.detail}'}',
        )
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: AppStrings.sectionEducation),
        const SizedBox(height: 18),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth < 820
                ? constraints.maxWidth
                : (constraints.maxWidth - 28) / 3;
            return Wrap(
              spacing: 14,
              runSpacing: 14,
              children: [
                InfoListCard(
                  title: 'Education',
                  items: educationItems,
                  width: width,
                ),
                InfoListCard(
                  title: 'Certifications',
                  items: certifications,
                  width: width,
                ),
                InfoListCard(
                  title: 'Achievements',
                  items: achievements,
                  width: width,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
