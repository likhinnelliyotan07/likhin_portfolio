import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/animated_section.dart';
import '../../../../core/widgets/section_header.dart';
import '../../domain/entities/project.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key, required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    final featured = projects.take(2).toList();
    final others = projects.skip(2).toList();

    return AnimatedSection(
      delay: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            badge: AppStrings.badgeProjects,
            title: AppStrings.sectionProjects,
            subtitle:
                'Production-grade apps shipped across hospitality, food delivery, AI, healthcare, and commerce.',
          ),
          const SizedBox(height: 48),
          // ── Featured projects (2-col large cards) ────────────
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 720;
              final cardWidth = isMobile
                  ? constraints.maxWidth
                  : (constraints.maxWidth - 20) / 2;
              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: featured
                    .map(
                      (p) => ProjectCard(
                        project: p,
                        width: cardWidth,
                        featured: true,
                      ),
                    )
                    .toList(),
              );
            },
          ),
          if (others.isNotEmpty) ...[
            const SizedBox(height: 48),
            // ── Other projects divider ──────────────────────────
            Row(
              children: [
                Text(
                  AppStrings.sectionOtherProjects,
                  style: TextStyle(
                    color: AppColors.muted,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(child: Container(height: 1, color: AppColors.border)),
              ],
            ),
            const SizedBox(height: 24),
            // ── Other projects (3-col compact cards) ──────────
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 720;
                final isTablet =
                    constraints.maxWidth >= 720 && constraints.maxWidth < 1060;
                final cols = isMobile ? 1 : (isTablet ? 2 : 3);
                final cardWidth =
                    (constraints.maxWidth - (cols - 1) * 16) / cols;
                return Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: others
                      .map(
                        (p) => ProjectCard(
                          project: p,
                          width: cardWidth,
                          featured: false,
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}
