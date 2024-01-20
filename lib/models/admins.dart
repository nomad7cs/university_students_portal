import 'package:univ_port_app/models/university_user.dart';

class AdminUser extends UniversityUser {
  static bool isAdmin = true;

  AdminUser({
    required String uid,
    required String displayName,
    required String email,
  }) : super(uid: uid, displayName: displayName, email: email);
}
