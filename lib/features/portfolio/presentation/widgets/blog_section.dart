import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/section_header.dart';
import '../../domain/entities/blog_article.dart';
import 'blog_card.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key, required this.blogs});

  final List<BlogArticle> blogs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: AppStrings.sectionBlog),
        const SizedBox(height: 18),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth < 820
                ? constraints.maxWidth
                : (constraints.maxWidth - 28) / 3;
            return Wrap(
              spacing: 14,
              runSpacing: 14,
              children: blogs
                  .map((blog) => BlogCard(blog: blog, width: width))
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}
