import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_decorations.dart';
import '../constants/app_text_styles.dart';

/// Premium section header with:
/// - Uppercase badge pill with accent color
/// - Large section title
/// - Optional lead body text (max 680px wide)
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.badge,
    this.subtitle,
    this.align = CrossAxisAlignment.start,
  });

  final String title;
  final String badge;
  final String? subtitle;
  final CrossAxisAlignment align;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align,
      children: [
        // ── Badge pill ──────────────────────────────────────
        DecoratedBox(
          decoration: AppDecorations.badge(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            child: Text(badge, style: AppTextStyles.badge),
          ),
        ),
        const SizedBox(height: 20),
        // ── Title ───────────────────────────────────────────
        Text(title, style: AppTextStyles.sectionTitle),
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Text(
              subtitle!,
              style: AppTextStyles.body.copyWith(
                color: AppColors.muted,
                height: 1.7,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
