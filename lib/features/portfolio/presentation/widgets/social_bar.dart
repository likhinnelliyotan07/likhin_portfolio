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
      children: links.map((link) => _SocialButton(link: link)).toList(),
    );
  }
}

class _SocialButton extends StatefulWidget {
  const _SocialButton({required this.link});
  final SocialLink link;

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => AppLauncher.openUrl(widget.link.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.primary.withValues(alpha: 0.12)
                : AppColors.surfaceAlt,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: _hovered ? AppColors.primary : AppColors.border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                SocialIcon.fromLabel(widget.link.label),
                size: 15,
                color: _hovered ? AppColors.primary : AppColors.muted,
              ),
              const SizedBox(width: 7),
              Text(
                widget.link.label,
                style: AppTextStyles.caption.copyWith(
                  color: _hovered ? AppColors.primary : AppColors.muted,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
