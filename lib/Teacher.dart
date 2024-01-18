import 'package:univ_port_app/course.dart';
import 'package:univ_port_app/university_user.dart';

class Teacher extends UniversityUser {
  List<Course>? courses;
  Teacher({required String displayName, required String email, required this.courses})
      : super(displayName: displayName, email: email);
}
