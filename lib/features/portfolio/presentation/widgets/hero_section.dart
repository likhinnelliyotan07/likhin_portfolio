import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/animated_section.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image.dart';
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
    return Stack(
      children: [
        // ── Dark hero with radial glow ───────────────────────
        Container(
          constraints: BoxConstraints(minHeight: context.isMobile ? 0 : 600),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.heroGradient,
            ),
          ),
          child: Stack(
            children: [
              // Top-right glow orb
              Positioned(
                top: -80,
                right: -60,
                child: Container(
                  width: 480,
                  height: 480,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primaryGlowColor,
                        AppColors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              // Bottom-left accent glow
              Positioned(
                bottom: -40,
                left: -40,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.accentGlowColor,
                        AppColors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              // ── Content ────────────────────────────────────
              Center(
                child: Container(
                  width: context.maxContentWidth,
                  padding: context.pagePadding.copyWith(
                    top: context.isMobile ? 64 : 100,
                    bottom: context.isMobile ? 56 : 80,
                  ),
                  child: AnimatedSection(
                    child: context.isMobile
                        ? _MobileHero(
                            profile: profile,
                            onProjects: onProjects,
                            onContact: onContact,
                          )
                        : _DesktopHero(
                            profile: profile,
                            onProjects: onProjects,
                            onContact: onContact,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Desktop layout ─────────────────────────────────────────
class _DesktopHero extends StatelessWidget {
  const _DesktopHero({
    required this.profile,
    required this.onProjects,
    required this.onContact,
  });

  final PortfolioProfile profile;
  final VoidCallback onProjects;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: _HeroContent(
                profile: profile,
                onProjects: onProjects,
                onContact: onContact,
              ),
            ),
            const SizedBox(width: 64),
            // Profile photo
            CustomImage(
              initials: 'LN',
              imageAsset: 'assets/images/profile.jpg',
              size: 240,
            ),
          ],
        ),
        const SizedBox(height: 64),
        const StatsStrip(),
      ],
    );
  }
}

// ── Mobile layout ──────────────────────────────────────────
class _MobileHero extends StatelessWidget {
  const _MobileHero({
    required this.profile,
    required this.onProjects,
    required this.onContact,
  });

  final PortfolioProfile profile;
  final VoidCallback onProjects;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Photo centered on mobile
        Center(
          child: CustomImage(
            initials: 'LN',
            imageAsset: 'assets/images/profile.jpg',
            size: 160,
          ),
        ),
        const SizedBox(height: 40),
        _HeroContent(
          profile: profile,
          onProjects: onProjects,
          onContact: onContact,
        ),
        const SizedBox(height: 48),
        const StatsStrip(),
      ],
    );
  }
}

// ── Shared text content ────────────────────────────────────
class _HeroContent extends StatelessWidget {
  const _HeroContent({
    required this.profile,
    required this.onProjects,
    required this.onContact,
  });

  final PortfolioProfile profile;
  final VoidCallback onProjects;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Badge ──────────────────────────────────────────
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)),
          ),
          child: Text(AppStrings.heroTag, style: AppTextStyles.badge),
        ),
        const SizedBox(height: 24),
        // ── Name ──────────────────────────────────────────
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppColors.ink, AppColors.primaryGlow],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            profile.name,
            style: AppTextStyles.hero.copyWith(color: AppColors.ink),
          ),
        ),
        const SizedBox(height: 12),
        // ── Role ──────────────────────────────────────────
        Text(
          profile.role,
          style: AppTextStyles.title.copyWith(
            color: AppColors.accent,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        // ── Intro ─────────────────────────────────────────
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(AppStrings.intro, style: AppTextStyles.body),
        ),
        const SizedBox(height: 32),
        // ── CTAs ──────────────────────────────────────────
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            CustomButton(
              label: AppStrings.ctaProjects,
              icon: Icons.arrow_forward_rounded,
              gradient: true,
              onPressed: onProjects,
            ),
            CustomButton(
              label: AppStrings.ctaContact,
              icon: Icons.mail_outline_rounded,
              outlined: true,
              onPressed: onContact,
            ),
          ],
        ),
        const SizedBox(height: 32),
        // ── Social links ──────────────────────────────────
        SocialBar(links: profile.contactInfo.socialLinks),
      ],
    );
  }
}
