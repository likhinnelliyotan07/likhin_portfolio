import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/app_launcher.dart';
import '../../domain/entities/project.dart';
import 'skill_chip.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project, required this.width});

  final Project project;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.phone_iphone, color: AppColors.primary, size: 30),
          const SizedBox(height: 14),
          Text(project.name, style: AppTextStyles.title),
          const SizedBox(height: 4),
          Text(project.role, style: AppTextStyles.subtitle),
          const SizedBox(height: 12),
          Text(project.summary, style: AppTextStyles.body),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.techStack
                .map((tech) => SkillChip(label: tech))
                .toList(),
          ),
          if (project.links.isNotEmpty) ...[
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: project.links
                  .map(
                    (link) => OutlinedButton.icon(
                      onPressed: () => AppLauncher.openUrl(link.url),
                      icon: const Icon(Icons.open_in_new, size: 16),
                      label: Text(link.label),
                    ),
                  )
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}
