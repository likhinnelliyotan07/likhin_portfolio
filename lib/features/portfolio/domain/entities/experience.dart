class Experience {
  const Experience({
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    required this.points,
  });

  final String role;
  final String company;
  final String period;
  final String location;
  final List<String> points;
}
