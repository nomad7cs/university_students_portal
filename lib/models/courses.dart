class Course {
  String? id;
  String code;
  String fullName;
  String teacherId;
  String? img;
  // DateTime? schedule;

  Course({
    required this.code,
    required this.fullName,
    required this.teacherId,
    // this.schedule,
    this.id,
    this.img,
  });
}
