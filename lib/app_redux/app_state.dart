import 'package:firebase_auth/firebase_auth.dart';

class MyAppState {
  final String currentUrl;
  final List<String> currentUrlStack;
  User? user;
  bool? unknownUrl = false;
  // String? studentId;
  List<ClassroomSlot>? todayCourses;
  List<Course>? studentCourses;

  MyAppState({
    required this.currentUrl,
    required this.currentUrlStack,
    this.user,
    this.todayCourses,
    this.studentCourses,
    // this.studentId,
    this.unknownUrl,
  });
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
