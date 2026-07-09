import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/app_launcher.dart';
import '../../domain/entities/project.dart';
import '../widgets/skill_chip.dart';

class ProjectCaseStudyPage extends StatefulWidget {
  final Project project;

  const ProjectCaseStudyPage({super.key, required this.project});

  @override
  State<ProjectCaseStudyPage> createState() => _ProjectCaseStudyPageState();
}

class _ProjectCaseStudyPageState extends State<ProjectCaseStudyPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeaderSection(),
                      const SizedBox(height: 48),
                      _buildSectionTitle('Overview & Business Problem', Icons.lightbulb_outline),
                      _buildParagraph(widget.project.businessProblem),
                      const SizedBox(height: 48),
                      _buildSectionTitle('Key Challenges', Icons.warning_amber_rounded),
                      _buildBulletList(widget.project.challenges),
                      const SizedBox(height: 48),
                      _buildArchitectureSection(),
                      const SizedBox(height: 48),
                      _buildSectionTitle('Performance & Optimization', Icons.speed_rounded),
                      _buildBulletList(widget.project.performanceOptimizations),
                      const SizedBox(height: 48),
                      _buildSectionTitle('Testing Strategy', Icons.science_outlined),
                      _buildParagraph(widget.project.testingStrategy),
                      const SizedBox(height: 48),
                      _buildSectionTitle('Business Impact', Icons.trending_up_rounded),
                      _buildBulletList(widget.project.businessImpact),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300.0,
      floating: false,
      pinned: true,
      backgroundColor: AppColors.surface,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded, color: AppColors.primary),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: 'project_bg_${widget.project.name}',
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withValues(alpha: 0.2),
                      AppColors.background,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              right: -50,
              top: -50,
              child: Opacity(
                opacity: 0.1,
                child: Icon(
                  Icons.architecture_rounded,
                  size: 400,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: 'project_icon_${widget.project.name}',
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.phone_iphone_rounded,
              color: AppColors.primary,
              size: 32,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Hero(
          tag: 'project_title_${widget.project.name}',
          child: Material(
            color: Colors.transparent,
            child: Text(
              widget.project.name,
              style: AppTextStyles.sectionTitle.copyWith(fontSize: 48),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.project.role,
          style: AppTextStyles.subtitle.copyWith(color: AppColors.accent),
        ),
        const SizedBox(height: 24),
        Text(
          widget.project.summary,
          style: AppTextStyles.body.copyWith(height: 1.5),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: widget.project.techStack.map((t) => SkillChip(label: t)).toList(),
        ),
        if (widget.project.links.isNotEmpty) ...[
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: widget.project.links
                .map(
                  (link) => ElevatedButton.icon(
                    onPressed: () => AppLauncher.openUrl(link.url),
                    icon: const Icon(Icons.open_in_new_rounded, size: 18),
                    label: Text(link.label),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.ink,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ],
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primary, size: 28),
          const SizedBox(width: 12),
          Text(title, style: AppTextStyles.title),
        ],
      ),
    );
  }

  Widget _buildParagraph(String text) {
    if (text.isEmpty) return const SizedBox.shrink();
    return Text(
      text,
      style: AppTextStyles.bodySmall.copyWith(
        height: 1.8,
        color: AppColors.muted,
      ),
    );
  }

  Widget _buildBulletList(List<String> items) {
    if (items.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8, right: 12),
                    child: Icon(Icons.circle, size: 8, color: AppColors.primary),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: AppTextStyles.bodySmall.copyWith(
                        height: 1.6,
                        color: AppColors.muted,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildArchitectureSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.architecture_rounded, color: AppColors.primary, size: 28),
              const SizedBox(width: 12),
              Text('System Architecture', style: AppTextStyles.title),
            ],
          ),
          const SizedBox(height: 32),
          _buildArchRow('State Management', widget.project.stateManagement, Icons.account_tree_rounded),
          _buildArchRow('Backend', widget.project.backend, Icons.dns_rounded),
          _buildArchRow('Database', widget.project.database, Icons.storage_rounded),
          _buildArchRow('Security', widget.project.security, Icons.security_rounded),
          _buildArchRow('Scalability', widget.project.scalability, Icons.layers_rounded),
        ],
      ),
    );
  }

  Widget _buildArchRow(String title, String value, IconData icon) {
    if (value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: Icon(icon, color: AppColors.accent, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.title.copyWith(
                    color: AppColors.ink,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.muted,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
