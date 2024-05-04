class Teacher {
  final String teacherId;
  final String name;
  final List<String> assignedCourses;

  Teacher({
    required this.teacherId,
    required this.name,
    this.assignedCourses = const [],
  });
}
