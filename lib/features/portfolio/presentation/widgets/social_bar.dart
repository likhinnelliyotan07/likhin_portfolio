import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/app_launcher.dart';
import '../../domain/entities/social_link.dart';
import 'social_icon.dart';

class SocialBar extends StatelessWidget {
  const SocialBar({super.key, required this.links});

  final List<SocialLink> links;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: links
          .map(
            (link) => ActionChip(
              backgroundColor: AppColors.surfaceAlt,
              side: const BorderSide(color: AppColors.border),
              avatar: Icon(
                SocialIcon.fromLabel(link.label),
                color: AppColors.primary,
                size: 17,
              ),
              label: Text(
                link.label,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.primary,
                ),
              ),
              onPressed: () => AppLauncher.openUrl(link.url),
            ),
          )
          .toList(),
    );
  }
}
