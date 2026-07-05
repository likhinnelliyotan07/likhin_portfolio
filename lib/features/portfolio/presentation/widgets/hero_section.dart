import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/animated_section.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../core/widgets/gradient_panel.dart';
import '../../domain/entities/portfolio_profile.dart';
import 'social_bar.dart';
import 'stats_strip.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.profile,
    required this.onProjects,
    required this.onContact,
  });

  final PortfolioProfile profile;
  final VoidCallback onProjects;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.heroTag, style: AppTextStyles.subtitle),
        const SizedBox(height: 14),
        Text(profile.name, style: AppTextStyles.hero),
        const SizedBox(height: 14),
        Text(
          profile.role,
          style: AppTextStyles.title.copyWith(color: AppColors.secondary),
        ),
        const SizedBox(height: 18),
        Text(AppStrings.intro, style: AppTextStyles.body),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            CustomButton(
              label: AppStrings.ctaProjects,
              icon: Icons.work_outline,
              gradient: true,
              onPressed: onProjects,
            ),
            CustomButton(
              label: AppStrings.ctaContact,
              icon: Icons.mail_outline,
              outlined: true,
              onPressed: onContact,
            ),
          ],
        ),
        const SizedBox(height: 24),
        SocialBar(links: profile.contactInfo.socialLinks),
      ],
    );
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.heroGradient,
        ),
      ),
      child: Center(
        child: Container(
          width: context.maxContentWidth,
          padding: context.pagePadding.copyWith(top: 42, bottom: 46),
          child: AnimatedSection(
            child: Column(
              children: [
                if (context.isMobile) ...[
                  content,
                  const SizedBox(height: 28),
                  GradientPanel(
                    colors: AppColors.contactGradient,
                    child: const Padding(
                      padding: EdgeInsets.all(5),
                      child: CustomImage(initials: 'LN', size: 132),
                    ),
                  ),
                ] else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 6, child: content),
                      const SizedBox(width: 48),
                      GradientPanel(
                        colors: AppColors.contactGradient,
                        child: const Padding(
                          padding: EdgeInsets.all(5),
                          child: CustomImage(initials: 'LN', size: 180),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 34),
                const StatsStrip(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
