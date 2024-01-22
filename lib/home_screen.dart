import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/dashboards/admin_dashboard.dart';
import 'package:univ_port_app/dashboards/students/student_dashboard.dart';
import 'package:univ_port_app/dashboards/teachers/teacher_dashboard.dart';
import 'package:univ_port_app/dashboards/upcomings.dart';
import 'package:univ_port_app/globals.dart' as globals;
import 'package:univ_port_app/models/admins.dart';
import 'package:univ_port_app/models/courses.dart';
import 'package:univ_port_app/models/students.dart';
import 'package:univ_port_app/models/teachers.dart';
import 'package:univ_port_app/models/university_user.dart';

import 'app_drawer.dart';
import 'custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? isStudent;
  int totalEarnedHours = 0;
  String displayName = '';
  String email = '';
  List<Course> courses = [];
  late UniversityUser currentUser;

  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .where('uid', isEqualTo: globals.reduxStore.state.user!.firebaseUser.uid)
  //       .get()
  //       .then((documentSnapshot) {
  //     if (documentSnapshot.docs.isNotEmpty) {
  //       if (documentSnapshot.docs[0].data().containsKey('isStudent')) {
  //         isStudent = documentSnapshot.docs[0]['isStudent'];
  //       }
  //       if (documentSnapshot.docs[0].data().containsKey('totalEarnedHours')) {
  //         totalEarnedHours = documentSnapshot.docs[0]['totalEarnedHours'];
  //       }
  //       if (documentSnapshot.docs[0].data().containsKey('displayName')) {
  //         username = documentSnapshot.docs[0]['displayName'];
  //       }
  //     }
  //   }).catchError((error) {
  //     if (kDebugMode) {
  //       print(error);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final bool isSmallScreen = mediaQuery.size.width < 600.0;
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(100),
      //   child: CustomAppBar(),
      // ),
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SafeArea(
        top: true,

        child: Stack(
          children: [
            Container(
              width: double.infinity, // Expand to full screen width
              // height: double.infinity, // Expand to full screen height

              child: const Image(
                image: AssetImage("assets/img/DpPQcNCW0AA9gFg.jpeg"),
                opacity: AlwaysStoppedAnimation(0.6),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: 1024,
              // color: Colors.tealAccent.withOpacity(0.5), // 50% transparent blue
              color: const Color.fromARGB(255, 25, 47, 89).withOpacity(0.5),
            ),
            FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .where('uid', isEqualTo: globals.reduxStore.state.user!.firebaseUser.uid)
                  .get(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error fetching notes');
                  } else {
                    if (snapshot.data!.docs.isNotEmpty) {
                      final userDoc = snapshot.data!.docs[0];
                      String targetUser = 'student'; // student, teacher, admin

                      if (userDoc.data().containsKey('displayName')) {
                        displayName = userDoc.data()['displayName'];
                      }
                      if (userDoc.data().containsKey('email')) {
                        email = userDoc.data()['email'];
                      }

                      if (userDoc.data().containsKey('isStudent') && userDoc.data()['isStudent']) {
                        isStudent = userDoc.data()['isStudent'];
                        if (userDoc.data().containsKey('totalEarnedHours')) {
                          totalEarnedHours = userDoc.data()['totalEarnedHours'];
                        }
                        if (userDoc.data().containsKey('courses')) {
                          courses = //userDoc.data()['courses'];
                              () {
                            List<Course> r = [];
                            for (var i = 0; i < userDoc.data()['courses'].length; i++) {
                              r.add(Course(
                                code: '',
                                fullName: userDoc.data()['courses'][i],
                                teacherId: '',
                              ));
                            }
                            return r;
                          }();
                        }

                        currentUser = Student(
                          uid: userDoc.data()['uid'],
                          displayName: displayName,
                          email: email,
                          earnedHours: totalEarnedHours,
                        );
                      } else if (userDoc.data().containsKey('isAdmin') && userDoc.data()['isAdmin']) {
                        targetUser = 'admin';
                        currentUser = AdminUser(
                          uid: userDoc.data()['uid'],
                          displayName: userDoc.data()['displayName'],
                          email: userDoc.data()['email'],
                        );
                      } else {
                        targetUser = 'teacher';
                        currentUser = Teacher(
                          uid: userDoc.data()['uid'],
                          displayName: userDoc.data()['displayName'],
                          email: userDoc.data()['email'],
                          courses: //userDoc.data()['courses'].map((c) => Course(code: 's', fullName: c)).toList() as List<Course>

                              () {
                            List<Course> r = [];
                            for (var i = 0; i < userDoc.data()['courses'].length; i++) {
                              r.add(Course(
                                code: '',
                                fullName: userDoc.data()['courses'][i],
                                teacherId: '',
                              ));
                            }
                            return r;
                          }(),
                          // courses: userDoc.data()['courses'].map((c) => Course(code: 's', fullName: c)).toList() as List<Course>,
                        );
                      }

                      return SingleChildScrollView(child: () {
                        List<Widget>? targetViews = [];
                        switch (targetUser) {
                          case 'admin':
                            targetViews = () {
                              return [
                                Flexible(
                                    child: AdminDashboard(
                                  admin: currentUser as AdminUser,
                                ))
                              ];
                            }();
                            break;
                          case 'teacher':
                            targetViews = [
                              Flexible(fit: FlexFit.loose, child: TeacherDashboard(teacher: currentUser as Teacher))
                            ];
                            break;
                          case 'student':
                          default:
                            targetViews = [
                              Flexible(
                                flex: 2,
                                fit: FlexFit.loose,
                                child: StudentDashboard(student: currentUser as Student),
                              ),
                              const SizedBox(width: 15.0),
                              const Flexible(fit: FlexFit.loose, child: Upcomings()),
                            ];
                            break;
                        }

                        if (isSmallScreen) {
                          return Container(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [...targetViews],
                            ),
                          );
                        } else {
                          return Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [...targetViews],
                            ),
                          );
                        }
                      }());
                    }
                    return const CircularProgressIndicator();
                  }
                } else {
                  return const Text('Unknown error');
                }
              },
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
