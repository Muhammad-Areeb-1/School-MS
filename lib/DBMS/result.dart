class Result {
  final String studentId;
  final String courseId;
  final int marksObtained;
  final int totalMarks;
  String grade;
  final String teacherId;

  Result({
    required this.studentId,
    required this.courseId,
    required this.marksObtained,
    required this.totalMarks,
    required this.teacherId,
    this.grade = '',
  });

  // Calculate the grade based on marks obtained and total marks.
  void calculateGrade() {
    // Perform your grading logic here and set the grade accordingly.
    // For simplicity, we'll use a basic grading scale.
    double percentage = (marksObtained / totalMarks) * 100;

    if (percentage >= 90) {
      grade = 'A+';
    } else if (percentage >= 80) {
      grade = 'A';
    } else if (percentage >= 70) {
      grade = 'B';
    } else if (percentage >= 60) {
      grade = 'C';
    } else if (percentage >= 50) {
      grade = 'D';
    } else {
      grade = 'F';
    }
  }
}
