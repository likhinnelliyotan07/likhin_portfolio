import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../domain/entities/portfolio_profile.dart';
import '../../domain/usecases/get_portfolio.dart';
import '../widgets/about_section.dart';
import '../widgets/blog_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/education_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/hero_section.dart';
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
  late final Future<PortfolioProfile> portfolio = widget.getPortfolio();
  final controller = ScrollController();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final blogKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<PortfolioProfile>(
        future: portfolio,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final profile = snapshot.data!;
          return CustomScrollView(
            controller: controller,
            slivers: [
              SliverToBoxAdapter(
                child: PortfolioNavBar(
                  onAbout: () => scrollTo(aboutKey),
                  onSkills: () => scrollTo(skillsKey),
                  onProjects: () => scrollTo(projectsKey),
                  onExperience: () => scrollTo(experienceKey),
                  onBlog: () => scrollTo(blogKey),
                  onContact: () => scrollTo(contactKey),
                ),
              ),
              SliverToBoxAdapter(
                child: HeroSection(
                  profile: profile,
                  onProjects: () => scrollTo(projectsKey),
                  onContact: () => scrollTo(contactKey),
                ),
              ),
              section(AboutSection(key: aboutKey, profile: profile)),
              section(
                SkillsSection(key: skillsKey, groups: profile.skillGroups),
              ),
              section(
                ProjectsSection(key: projectsKey, projects: profile.projects),
              ),
              section(
                ExperienceSection(
                  key: experienceKey,
                  experiences: profile.experiences,
                ),
              ),
              section(
                EducationSection(
                  education: profile.education,
                  certifications: profile.certifications,
                  achievements: profile.achievements,
                ),
              ),
              section(BlogSection(key: blogKey, blogs: profile.blogs)),
              section(
                ContactSection(key: contactKey, contact: profile.contactInfo),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
            ],
          );
        },
      ),
    );
  }

  SliverToBoxAdapter section(Widget child) {
    return SliverToBoxAdapter(
      child: Builder(
        builder: (context) => Center(
          child: Container(
            width: context.maxContentWidth,
            padding: context.pagePadding,
            child: child,
          ),
        ),
      ),
    );
  }
}

class PortfolioError extends StatelessWidget {
  const PortfolioError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.appTitle,
        style: AppTextStyles.title.copyWith(color: AppColors.danger),
      ),
    );
  }
}
