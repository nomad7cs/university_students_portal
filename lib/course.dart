class Course {
  String? id;
  String code;
  String fullName;
  String? img;
  String? teacher;
  // DateTime? schedule;

  Course(
      {required this.code,
      required this.fullName,
      // this.schedule,
      this.id,
      this.img});
}
