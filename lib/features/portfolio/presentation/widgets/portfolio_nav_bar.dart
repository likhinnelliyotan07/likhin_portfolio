import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';

/// Premium sticky nav bar — glassmorphism on scroll.
class PortfolioNavBar extends StatefulWidget {
  const PortfolioNavBar({
    super.key,
    required this.scrolled,
    required this.onAbout,
    required this.onSkills,
    required this.onExperience,
    required this.onProjects,
    required this.onBlog,
    required this.onContact,
  });

  final bool scrolled;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onExperience;
  final VoidCallback onProjects;
  final VoidCallback onBlog;
  final VoidCallback onContact;

  @override
  State<PortfolioNavBar> createState() => _PortfolioNavBarState();
}

class _PortfolioNavBarState extends State<PortfolioNavBar> {
  bool _drawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 64,
      decoration: BoxDecoration(
        color: widget.scrolled
            ? AppColors.background.withValues(alpha: 0.85)
            : AppColors.transparent,
        border: Border(
          bottom: BorderSide(
            color: widget.scrolled ? AppColors.border : AppColors.transparent,
          ),
        ),
      ),
      child: Center(
        child: SizedBox(
          width: context.maxContentWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.isMobile ? 24 : 64,
            ),
            child: Row(
              children: [
                // ── Logo ────────────────────────────────────
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 32,
                          height: 32,
                          fit: BoxFit.contain,
                          errorBuilder: (ctx, err, stack) => Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: AppColors.primaryGradient,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'LN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text('Likhin', style: AppTextStyles.brand),
                    ],
                  ),
                ),
                const Spacer(),
                // ── Desktop nav ──────────────────────────────
                if (context.isDesktop)
                  _DesktopNav(
                    onAbout: widget.onAbout,
                    onSkills: widget.onSkills,
                    onExperience: widget.onExperience,
                    onProjects: widget.onProjects,
                    onBlog: widget.onBlog,
                    onContact: widget.onContact,
                  )
                else
                  // ── Mobile hamburger ──────────────────────
                  IconButton(
                    icon: Icon(
                      _drawerOpen ? Icons.close : Icons.menu,
                      color: AppColors.ink,
                    ),
                    onPressed: () {
                      setState(() => _drawerOpen = !_drawerOpen);
                      _showMobileMenu(context);
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => _MobileMenu(
        onAbout: () {
          Navigator.pop(context);
          widget.onAbout();
        },
        onSkills: () {
          Navigator.pop(context);
          widget.onSkills();
        },
        onExperience: () {
          Navigator.pop(context);
          widget.onExperience();
        },
        onProjects: () {
          Navigator.pop(context);
          widget.onProjects();
        },
        onBlog: () {
          Navigator.pop(context);
          widget.onBlog();
        },
        onContact: () {
          Navigator.pop(context);
          widget.onContact();
        },
      ),
    ).whenComplete(() {
      if (mounted) setState(() => _drawerOpen = false);
    });
  }
}

class _DesktopNav extends StatelessWidget {
  const _DesktopNav({
    required this.onAbout,
    required this.onSkills,
    required this.onExperience,
    required this.onProjects,
    required this.onBlog,
    required this.onContact,
  });

  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onExperience;
  final VoidCallback onProjects;
  final VoidCallback onBlog;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final items = [
      (AppStrings.navAbout, onAbout),
      (AppStrings.navSkills, onSkills),
      (AppStrings.navExperience, onExperience),
      (AppStrings.navProjects, onProjects),
      (AppStrings.navBlog, onBlog),
    ];
    return Row(
      children: [
        ...items.map((item) => _NavItem(label: item.$1, onTap: item.$2)),
        const SizedBox(width: 16),
        // ── Hire me pill ─────────────────────────────────────
        _HireMeButton(onPressed: onContact),
      ],
    );
  }
}

class _NavItem extends StatefulWidget {
  const _NavItem({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 150),
            style: AppTextStyles.nav.copyWith(
              color: _hovered ? AppColors.ink : AppColors.muted,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}

class _HireMeButton extends StatefulWidget {
  const _HireMeButton({required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<_HireMeButton> createState() => _HireMeButtonState();
}

class _HireMeButtonState extends State<_HireMeButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: AppColors.primaryGradient),
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(
                  alpha: _hovered ? 0.5 : 0.25,
                ),
                blurRadius: _hovered ? 24 : 14,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            AppStrings.ctaHire,
            style: AppTextStyles.button.copyWith(fontSize: 13),
          ),
        ),
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  const _MobileMenu({
    required this.onAbout,
    required this.onSkills,
    required this.onExperience,
    required this.onProjects,
    required this.onBlog,
    required this.onContact,
  });

  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onExperience;
  final VoidCallback onProjects;
  final VoidCallback onBlog;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final items = [
      (AppStrings.navAbout, onAbout),
      (AppStrings.navSkills, onSkills),
      (AppStrings.navExperience, onExperience),
      (AppStrings.navProjects, onProjects),
      (AppStrings.navBlog, onBlog),
      (AppStrings.navContact, onContact),
    ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.subtle,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            ...items.map(
              (item) => ListTile(
                title: Text(
                  item.$1,
                  style: AppTextStyles.title.copyWith(fontSize: 18),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: AppColors.muted,
                ),
                onTap: item.$2,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
