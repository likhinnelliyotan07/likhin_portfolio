import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/entities/blog_article.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({super.key, required this.blog, required this.width});

  final BlogArticle blog;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(blog.category, style: AppTextStyles.subtitle),
          const SizedBox(height: 10),
          Text(blog.title, style: AppTextStyles.title),
          const SizedBox(height: 12),
          Text(blog.body, style: AppTextStyles.bodySmall),
        ],
      ),
    );
  }
}
