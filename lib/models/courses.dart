import 'package:univ_port_app/models/students.dart';

class Course {
  String? id;
  String code;
  String fullName;
  String teacherId;
  String? img;
  List<Student>? students;
  // DateTime? schedule;

  Course(
      {required this.code,
      required this.fullName,
      required this.teacherId,
      // this.schedule,
      this.id,
      this.img,
      this.students});
}
