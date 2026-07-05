import 'blog_article.dart';
import 'contact_info.dart';
import 'education.dart';
import 'experience.dart';
import 'project.dart';
import 'skill_group.dart';

class PortfolioProfile {
  const PortfolioProfile({
    required this.name,
    required this.role,
    required this.tagline,
    required this.summary,
    required this.contactInfo,
    required this.skillGroups,
    required this.experiences,
    required this.projects,
    required this.education,
    required this.certifications,
    required this.achievements,
    required this.blogs,
  });

  final String name;
  final String role;
  final String tagline;
  final String summary;
  final ContactInfo contactInfo;
  final List<SkillGroup> skillGroups;
  final List<Experience> experiences;
  final List<Project> projects;
  final List<Education> education;
  final List<String> certifications;
  final List<String> achievements;
  final List<BlogArticle> blogs;
}
