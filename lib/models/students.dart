import 'package:univ_port_app/models/courses.dart';
import 'package:univ_port_app/models/university_user.dart';

class Student extends UniversityUser {
  List<Course>? courses;
  int earnedHours;
  Student({required String displayName, required String email, required this.courses, required this.earnedHours})
      : super(displayName: displayName, email: email);
}
