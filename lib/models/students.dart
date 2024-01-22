import 'package:univ_port_app/models/university_user.dart';

class Student extends UniversityUser {
  // List<Course>? courses;
  int earnedHours;
  Student(
      {required String uid,
      required String displayName,
      required String email,
      // this.courses,
      required this.earnedHours})
      : super(uid: uid, displayName: displayName, email: email);
}
