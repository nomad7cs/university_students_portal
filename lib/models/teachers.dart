import 'package:univ_port_app/models/courses.dart';
import 'package:univ_port_app/models/university_user.dart';

class Teacher extends UniversityUser {
  List<Course>? courses;
  Teacher({required String uid, required String displayName, required String email, required this.courses})
      : super(uid: uid, displayName: displayName, email: email);
}
