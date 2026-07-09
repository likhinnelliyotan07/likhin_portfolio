import 'project_link.dart';

class Project {
  const Project({
    required this.name,
    required this.role,
    required this.summary,
    required this.techStack,
    required this.links,
    // Case Study fields
    this.businessProblem = '',
    this.challenges = const [],
    this.stateManagement = '',
    this.backend = '',
    this.database = '',
    this.authentication = '',
    this.performanceOptimizations = const [],
    this.security = '',
    this.testingStrategy = '',
    this.scalability = '',
    this.lessonsLearned = const [],
    this.businessImpact = const [],
  });

  final String name;
  final String role;
  final String summary;
  final List<String> techStack;
  final List<ProjectLink> links;

  // Case Study fields
  final String businessProblem;
  final List<String> challenges;
  final String stateManagement;
  final String backend;
  final String database;
  final String authentication;
  final List<String> performanceOptimizations;
  final String security;
  final String testingStrategy;
  final String scalability;
  final List<String> lessonsLearned;
  final List<String> businessImpact;
}
