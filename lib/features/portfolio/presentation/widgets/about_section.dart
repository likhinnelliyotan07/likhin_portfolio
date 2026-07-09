import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/animated_section.dart';
import '../../../../core/widgets/section_header.dart';
import '../../domain/entities/portfolio_profile.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.profile});

  final PortfolioProfile profile;

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            badge: AppStrings.badgeAbout,
            title: AppStrings.sectionAbout,
            subtitle: AppStrings.aboutBody,
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 760) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _BioText(summary: profile.summary),
                    const SizedBox(height: 32),
                    _HighlightCards(),
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: _BioText(summary: profile.summary),
                  ),
                  const SizedBox(width: 48),
                  Expanded(
                    flex: 4,
                    child: _HighlightCards(),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _BioText extends StatelessWidget {
  const _BioText({required this.summary});
  final String summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          summary,
          style: AppTextStyles.body.copyWith(
            color: AppColors.muted,
            height: 1.75,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 24),
        // ── Location badge ─────────────────────────────────
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: AppColors.accent,
              size: 16,
            ),
            const SizedBox(width: 6),
            Text(
              AppStrings.location,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _HighlightCards extends StatelessWidget {
  const _HighlightCards();

  @override
  Widget build(BuildContext context) {
    final highlights = [
      (
        Icons.architecture_outlined,
        AppStrings.aboutHighlight1,
        AppStrings.aboutHighlight1Sub,
        AppColors.primary,
      ),
      (
        Icons.devices_outlined,
        AppStrings.aboutHighlight2,
        AppStrings.aboutHighlight2Sub,
        AppColors.accent,
      ),
      (
        Icons.cloud_outlined,
        AppStrings.aboutHighlight3,
        AppStrings.aboutHighlight3Sub,
        AppColors.success,
      ),
    ];

    return Column(
      children: highlights
          .map((h) => _HighlightCard(
                icon: h.$1,
                title: h.$2,
                subtitle: h.$3,
                color: h.$4,
              ))
          .toList(),
    );
  }
}

class _HighlightCard extends StatefulWidget {
  const _HighlightCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  @override
  State<_HighlightCard> createState() => _HighlightCardState();
}

class _HighlightCardState extends State<_HighlightCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(18),
        transform: Matrix4.translationValues(0.0, _hovered ? -3.0 : 0.0, 0.0),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.surface
              : AppColors.surface.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered
                ? widget.color.withValues(alpha: 0.4)
                : AppColors.border,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: widget.color.withValues(alpha: 0.15),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: widget.color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(widget.icon, color: widget.color, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.ink,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.subtitle,
                    style: AppTextStyles.caption.copyWith(
                      color: widget.color.withValues(alpha: 0.85),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
