import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.initials,
    this.imageUrl,
    this.size = 148,
  });

  final String initials;
  final String? imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    final child = imageUrl == null
        ? Text(
            initials,
            style: AppTextStyles.hero.copyWith(color: AppColors.surface),
          )
        : Image.network(imageUrl!, fit: BoxFit.cover);
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: AppColors.shadow, blurRadius: 24)],
      ),
      child: Center(child: child),
    );
  }
}
