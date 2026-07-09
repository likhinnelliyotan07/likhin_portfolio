import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/app_launcher.dart';
import '../../domain/entities/project.dart';
import '../pages/project_case_study_page.dart';
import 'skill_chip.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required this.project,
    required this.width,
    this.featured = false,
  });

  final Project project;
  final double width;
  final bool featured;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  ProjectCaseStudyPage(project: widget.project),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
              transitionDuration: const Duration(milliseconds: 500),
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width,
          transform: Matrix4.translationValues(0.0, _hovered ? -4.0 : 0.0, 0.0),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: _hovered
                  ? AppColors.primary.withValues(alpha: 0.4)
                  : AppColors.border,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.12),
                      blurRadius: 36,
                      offset: const Offset(0, 12),
                    ),
                  ]
                : [
                    const BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Hero(
                    tag: 'project_bg_${widget.project.name}',
                    child: Material(color: Colors.transparent),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Featured header strip ─────────────────────────
                    if (widget.featured)
                      Container(
                        height: 5,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: AppColors.primaryGradient,
                          ),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(22),
                          ),
                        ),
                      ),
                    // ── Card content ───────────────────────────────────
                    Padding(
                      padding: EdgeInsets.all(widget.featured ? 24 : 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Icon
                          Hero(
                            tag: 'project_icon_${widget.project.name}',
                            child: Container(
                              width: widget.featured ? 48 : 40,
                              height: widget.featured ? 48 : 40,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.phone_iphone_rounded,
                                color: AppColors.primary,
                                size: widget.featured ? 24 : 20,
                              ),
                            ),
                          ),
                          SizedBox(height: widget.featured ? 16 : 12),
                          // Name
                          Hero(
                            tag: 'project_title_${widget.project.name}',
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                widget.project.name,
                                style: AppTextStyles.title.copyWith(
                                  fontSize: widget.featured ? 20 : 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Role
                          Text(
                            widget.project.role,
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.accent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: widget.featured ? 14 : 10),
                          // Summary
                          Text(
                            widget.project.summary,
                            style: AppTextStyles.bodySmall.copyWith(
                              height: 1.65,
                            ),
                          ),
                          const SizedBox(height: 14),
                          // Tech stack chips
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: widget.project.techStack
                                .map((t) => SkillChip(label: t))
                                .toList(),
                          ),
                          const SizedBox(height: 16),
                          // View Case Study Button
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            opacity: _hovered ? 1.0 : 0.7,
                            child: Row(
                              children: [
                                Text(
                                  'View Case Study',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: AppColors.primary,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LinkButton extends StatefulWidget {
  const _LinkButton({required this.label, required this.url});
  final String label;
  final String url;

  @override
  State<_LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<_LinkButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => AppLauncher.openUrl(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.primary.withValues(alpha: 0.12)
                : AppColors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered ? AppColors.primary : AppColors.border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.open_in_new_rounded,
                size: 13,
                color: _hovered ? AppColors.primary : AppColors.muted,
              ),
              const SizedBox(width: 5),
              Text(
                widget.label,
                style: AppTextStyles.caption.copyWith(
                  color: _hovered ? AppColors.primary : AppColors.muted,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
