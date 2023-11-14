import 'package:firebase_auth/firebase_auth.dart';

class MyAppState {
  final String currentUrl;
  final List<String> currentUrlStack;
  User? user;

  MyAppState({required this.currentUrl, required this.currentUrlStack, this.user});
}
