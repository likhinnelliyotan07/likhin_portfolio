import 'project_link.dart';

class Project {
  const Project({
    required this.name,
    required this.role,
    required this.summary,
    required this.techStack,
    required this.links,
  });

  final String name;
  final String role;
  final String summary;
  final List<String> techStack;
  final List<ProjectLink> links;
}
