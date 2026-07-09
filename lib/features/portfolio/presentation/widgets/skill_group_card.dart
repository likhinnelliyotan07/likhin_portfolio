import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/entities/skill_group.dart';
import 'skill_chip.dart';

class SkillGroupCard extends StatefulWidget {
  const SkillGroupCard({super.key, required this.group});

  final SkillGroup group;

  @override
  State<SkillGroupCard> createState() => _SkillGroupCardState();
}

class _SkillGroupCardState extends State<SkillGroupCard> {
  bool _hovered = false;

  // Map group titles to icons
  static IconData _iconFor(String title) {
    return switch (title.toLowerCase()) {
      'mobile' => Icons.phone_iphone_outlined,
      'architecture' => Icons.account_tree_outlined,
      'backend and cloud' => Icons.cloud_outlined,
      'storage and device' => Icons.storage_outlined,
      'ai and 3d' => Icons.auto_awesome_outlined,
      'delivery' => Icons.rocket_launch_outlined,
      _ => Icons.code_outlined,
    };
  }

  static Color _colorFor(String title) {
    return switch (title.toLowerCase()) {
      'mobile' => AppColors.primary,
      'architecture' => AppColors.accent,
      'backend and cloud' => AppColors.success,
      'storage and device' => const Color(0xFF60A5FA),
      'ai and 3d' => const Color(0xFFE879F9),
      'delivery' => const Color(0xFF34D399),
      _ => AppColors.primary,
    };
  }

  @override
  Widget build(BuildContext context) {
    final color = _colorFor(widget.group.title);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 320,
        transform: Matrix4.translationValues(0.0, _hovered ? -4.0 : 0.0, 0.0),
        transformAlignment: Alignment.center,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered ? color.withValues(alpha: 0.4) : AppColors.border,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: color.withValues(alpha: 0.15),
                    blurRadius: 32,
                    offset: const Offset(0, 8),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Icon + title row ─────────────────────────────
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    _iconFor(widget.group.title),
                    color: color,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  widget.group.title,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.ink,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            // ── Skill chips ──────────────────────────────────
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.group.skills
                  .map((skill) => SkillChip(label: skill, color: color))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
