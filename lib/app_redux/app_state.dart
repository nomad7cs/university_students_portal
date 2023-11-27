import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class MyAppState {
  final String currentUrl;
  final List<String> currentUrlStack;
  AppUser? user;
  bool? unknownUrl = false;
  // String? studentId;
  List<ClassroomSlot>? todayCourses;
  List<Course>? studentCourses;
  bool? isStudent;
  bool? isStudentPayload;
  bool editingUser = false;
  int? totalEarnedHours;
  int? earnedHoursPayload;
  int stateCounter;

  MyAppState({
    required this.currentUrl,
    required this.currentUrlStack,
    this.user,
    this.todayCourses,
    this.studentCourses,
    // this.studentId,
    this.unknownUrl,
    this.isStudentPayload,
    this.isStudent,
    this.editingUser = false,
    this.totalEarnedHours,
    this.earnedHoursPayload,
    this.stateCounter = 1,
  }) {
    if (kDebugMode) {
      print('\x1B[33m${DateTime.now()}\x1B[0m');
      print('\x1B[33mState Number:\x1B[0m $stateCounter');
      print('\x1B[33mCurrentUrl:\x1B[0m $currentUrl \t \x1B[33mcurrentUrlStack:\x1B[0m  $currentUrlStack');
      print('\x1B[33muser.uid:\x1B[0m  ${user?.firebaseUser.uid}');
      print('\x1B[33muser.name:\x1B[0m  ${user?.firebaseUser.displayName}');
      print('\x1B[33meditingUserType:\x1B[0m  $editingUser \t\x1B[33misStudentPayload:\x1B[0m $isStudentPayload');
      print('\x1B[33misStudent:\x1B[0m  $isStudent');
      print('\x1B[33mtotalEarnedHours:\x1B[0m  $totalEarnedHours');
      print('\x1B[33mearnedHoursPayload:\x1B[0m  $earnedHoursPayload');
    }
  }

  // toString() {
  //   return "--currentUrl: " + currentUrl + "       --isStudent: " + '${isStudent ?? null}';
  // }
}

class Course {
  String? id;
  String code;
  String fullName;
  String? img;
  // DateTime? schedule;

  Course(
      {required this.code,
      required this.fullName,
      // this.schedule,
      this.id,
      this.img});
}

class AppUser {
  User firebaseUser;
  bool? isStudent;
  Course? courses;
  AppUser({required this.firebaseUser, this.isStudent, this.courses});
}

class ClassroomSlot {
  String? id;
  String location;
  String teacher;
  Course course;
  DateTime dateTime;
  String duration; // in Hours
  int participants;
  int credit;
  // int capacity;

  ClassroomSlot({
    required this.location,
    required this.teacher,
    required this.course,
    required this.dateTime,
    // required this.capacity,
    required this.participants,
    required this.duration,
    required this.credit,
    this.id,
  });
}
