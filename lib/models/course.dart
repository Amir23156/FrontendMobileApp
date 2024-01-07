class Course {
  final String id;
  final String courseId;
  final String courseName;
  final List<Instructor> instructors;

  Course({
    required this.id,
    required this.courseId,
    required this.courseName,
    required this.instructors,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      courseId: json['courseId'],
      courseName: json['courseName'],
      instructors: (json['instructors'] as List<dynamic>)
          .map((instructorJson) => Instructor.fromJson(instructorJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'courseName': courseName,
      'instructors':
          instructors.map((instructor) => instructor.toJson()).toList(),
    };
  }
}

class Instructor {
  final String instructorId;
  final String instructorName;

  Instructor({
    required this.instructorId,
    required this.instructorName,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      instructorId: json['instructorId'],
      instructorName: json['instructorName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instructorId': instructorId,
      'instructorName': instructorName,
    };
  }
}
