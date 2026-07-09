import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/animated_section.dart';
import '../../../../core/widgets/section_header.dart';
import '../../domain/entities/blog_article.dart';
import 'blog_card.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key, required this.blogs});

  final List<BlogArticle> blogs;

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      delay: 80,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0),
        decoration: const BoxDecoration(color: AppColors.surfaceAlt),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              badge: AppStrings.badgeBlog,
              title: AppStrings.sectionBlog,
              subtitle:
                  'Thoughts on architecture, AI integration, and mobile engineering craft.',
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
                  children: blogs
                      .map((blog) => BlogCard(blog: blog, width: cardWidth))
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
