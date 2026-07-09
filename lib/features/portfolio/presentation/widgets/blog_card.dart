import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/entities/blog_article.dart';

class BlogCard extends StatefulWidget {
  const BlogCard({super.key, required this.blog, required this.width});

  final BlogArticle blog;
  final double width;

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  bool _hovered = false;

  static Color _categoryColor(String category) {
    return switch (category.toLowerCase()) {
      'architecture' => AppColors.primary,
      'ai integration' => const Color(0xFFE879F9),
      'delivery' => AppColors.success,
      _ => AppColors.accent,
    };
  }

  @override
  Widget build(BuildContext context) {
    final color = _categoryColor(widget.blog.category);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width,
        transform: Matrix4.translationValues(0.0, _hovered ? -4.0 : 0.0, 0.0),
        transformAlignment: Alignment.center,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered ? color.withValues(alpha: 0.4) : AppColors.border,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: color.withValues(alpha: 0.12),
                    blurRadius: 28,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [
                  const BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 16,
                    offset: Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Category badge ─────────────────────────────────
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: color.withValues(alpha: 0.3)),
              ),
              child: Text(
                widget.blog.category,
                style: AppTextStyles.caption.copyWith(
                  color: color,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 14),
            // ── Title ──────────────────────────────────────────
            Text(
              widget.blog.title,
              style: AppTextStyles.title.copyWith(fontSize: 16, height: 1.4),
            ),
            const SizedBox(height: 10),
            // ── Excerpt ────────────────────────────────────────
            Text(
              widget.blog.body,
              style: AppTextStyles.bodySmall.copyWith(height: 1.65),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 18),
            // ── Read arrow ────────────────────────────────────
            Row(
              children: [
                Text(
                  'Read more',
                  style: AppTextStyles.caption.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 4),
                AnimatedSlide(
                  offset: _hovered ? const Offset(0.3, 0) : Offset.zero,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    size: 13,
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
