import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/section_header.dart';
import '../../domain/entities/portfolio_profile.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.profile});

  final PortfolioProfile profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: AppStrings.sectionAbout,
          subtitle: AppStrings.aboutBody,
        ),
        const SizedBox(height: 18),
        Text(profile.summary, style: AppTextStyles.body),
      ],
    );
  }
}
