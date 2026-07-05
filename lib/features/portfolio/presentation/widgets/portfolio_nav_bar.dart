import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';

class PortfolioNavBar extends StatelessWidget {
  const PortfolioNavBar({
    super.key,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onExperience,
    required this.onBlog,
    required this.onContact,
  });

  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onExperience;
  final VoidCallback onBlog;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final items = [
      (AppStrings.navAbout, onAbout),
      (AppStrings.navSkills, onSkills),
      (AppStrings.navProjects, onProjects),
      (AppStrings.navExperience, onExperience),
      (AppStrings.navBlog, onBlog),
      (AppStrings.navContact, onContact),
    ];
    return Container(
      color: AppColors.surface,
      padding: context.pagePadding.copyWith(top: 16, bottom: 16),
      child: Center(
        child: SizedBox(
          width: context.maxContentWidth,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(AppStrings.name, style: AppTextStyles.title),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: items
                    .map(
                      (item) =>
                          TextButton(onPressed: item.$2, child: Text(item.$1)),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
