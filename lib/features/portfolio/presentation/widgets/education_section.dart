import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/animated_section.dart';
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
          (e) =>
              '${e.degree}\n${e.institute} · ${e.year}${e.detail != null ? ' · ${e.detail}' : ''}',
        )
        .toList();

    return AnimatedSection(
      delay: 80,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              badge: AppStrings.badgeEducation,
              title: AppStrings.sectionEducation,
            ),
            const SizedBox(height: 48),
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 820;
                final cols = isMobile ? 1 : 3;
                final cardWidth =
                    (constraints.maxWidth - (cols - 1) * 16) / cols;
                return Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    InfoListCard(
                      title: 'Education',
                      icon: Icons.school_outlined,
                      iconColor: AppColors.primary,
                      items: educationItems,
                      width: cardWidth,
                      richLines: true,
                    ),
                    InfoListCard(
                      title: 'Certifications',
                      icon: Icons.workspace_premium_outlined,
                      iconColor: AppColors.accent,
                      items: certifications,
                      width: cardWidth,
                    ),
                    InfoListCard(
                      title: 'Achievements',
                      icon: Icons.emoji_events_outlined,
                      iconColor: AppColors.success,
                      items: achievements,
                      width: cardWidth,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
