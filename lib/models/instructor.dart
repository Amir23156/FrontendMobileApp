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
