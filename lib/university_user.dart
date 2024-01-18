class UniversityUser {
  String displayName;
  String email;

  UniversityUser({required this.displayName, required this.email});
}

class AdminUser extends UniversityUser {
  static bool isAdmin = true;

  AdminUser({
    required String displayName,
    required String email,
  }) : super(displayName: displayName, email: email);
}
