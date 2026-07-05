class Education {
  const Education({
    required this.degree,
    required this.institute,
    required this.year,
    this.detail,
  });

  final String degree;
  final String institute;
  final String year;
  final String? detail;
}
