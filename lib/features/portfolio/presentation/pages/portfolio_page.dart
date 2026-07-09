import 'package:flutter/material.dart';

import '../../../../core/widgets/background_orbs.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/responsive.dart';
import '../../domain/entities/portfolio_profile.dart';
import '../../domain/usecases/get_portfolio.dart';
import '../widgets/about_section.dart';
import '../widgets/blog_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/education_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/floating_cta.dart';
import '../widgets/hero_section.dart';
import '../widgets/loading_screen.dart';
import '../widgets/portfolio_nav_bar.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key, required this.getPortfolio});

  final GetPortfolio getPortfolio;

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  late final Future<PortfolioProfile> _portfolio = widget.getPortfolio();
  final _scrollController = ScrollController();

  // ── Section keys ────────────────────────────────────────────
  final _heroKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _educationKey = GlobalKey();
  final _blogKey = GlobalKey();
  final _contactKey = GlobalKey();

  // ── Scroll state ────────────────────────────────────────────
  bool _navScrolled = false;
  bool _showFloatingCta = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final pos = _scrollController.offset;
    final newNavScrolled = pos > 60;
    final newShowCta = pos > 400;
    if (newNavScrolled != _navScrolled || newShowCta != _showFloatingCta) {
      setState(() {
        _navScrolled = newNavScrolled;
        _showFloatingCta = newShowCta;
      });
    }
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
      alignment: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: FutureBuilder<PortfolioProfile>(
        future: _portfolio,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const LoadingScreen();
          final profile = snapshot.data!;
          return Stack(
            children: [
              // ── Global Background Effects ────────────────────
              const Positioned.fill(child: BackgroundOrbs()),
              // ── Scrollable content ─────────────────────────
              CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // Sticky nav
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _NavBarDelegate(
                      scrolled: _navScrolled,
                      onAbout: () => _scrollTo(_aboutKey),
                      onSkills: () => _scrollTo(_skillsKey),
                      onExperience: () => _scrollTo(_experienceKey),
                      onProjects: () => _scrollTo(_projectsKey),
                      onBlog: () => _scrollTo(_blogKey),
                      onContact: () => _scrollTo(_contactKey),
                    ),
                  ),
                  // Hero — full bleed, no container constraint
                  SliverToBoxAdapter(
                    child: HeroSection(
                      key: _heroKey,
                      profile: profile,
                      onProjects: () => _scrollTo(_projectsKey),
                      onContact: () => _scrollTo(_contactKey),
                    ),
                  ),
                  // Remaining sections — centered with max width
                  _section(AboutSection(key: _aboutKey, profile: profile)),
                  _section(
                    SkillsSection(key: _skillsKey, groups: profile.skillGroups),
                  ),
                  _section(
                    ExperienceSection(
                      key: _experienceKey,
                      experiences: profile.experiences,
                    ),
                  ),
                  _section(
                    ProjectsSection(
                      key: _projectsKey,
                      projects: profile.projects,
                    ),
                  ),
                  _section(
                    EducationSection(
                      key: _educationKey,
                      education: profile.education,
                      certifications: profile.certifications,
                      achievements: profile.achievements,
                    ),
                  ),
                  _section(BlogSection(key: _blogKey, blogs: profile.blogs)),
                  _section(
                    ContactSection(
                      key: _contactKey,
                      contact: profile.contactInfo,
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 80)),
                ],
              ),
              // ── Floating CTA ───────────────────────────────
              Positioned(
                bottom: 32,
                right: 32,
                child: FloatingCta(
                  visible: _showFloatingCta,
                  onPressed: () => _scrollTo(_contactKey),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  SliverToBoxAdapter _section(Widget child) {
    return SliverToBoxAdapter(
      child: Builder(
        builder: (context) => Center(
          child: Container(
            width: context.maxContentWidth,
            padding: context.pagePadding.copyWith(
              top: context.sectionPaddingV,
              bottom: context.sectionPaddingV,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// Sticky nav bar delegate
class _NavBarDelegate extends SliverPersistentHeaderDelegate {
  _NavBarDelegate({
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
  double get minExtent => 64;
  @override
  double get maxExtent => 64;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return PortfolioNavBar(
      scrolled: scrolled,
      onAbout: onAbout,
      onSkills: onSkills,
      onExperience: onExperience,
      onProjects: onProjects,
      onBlog: onBlog,
      onContact: onContact,
    );
  }

  @override
  bool shouldRebuild(_NavBarDelegate old) => old.scrolled != scrolled;
}

class PortfolioError extends StatelessWidget {
  const PortfolioError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.appTitle,
        style: const TextStyle(color: AppColors.danger, fontSize: 24),
      ),
    );
  }
}
