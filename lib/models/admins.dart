import 'package:univ_port_app/models/university_user.dart';

class AdminUser extends UniversityUser {
  static bool isAdmin = true;

  AdminUser({
    required String displayName,
    required String email,
  }) : super(displayName: displayName, email: email);
}
