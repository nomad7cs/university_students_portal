import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/Teacher.dart';
import 'package:univ_port_app/course.dart';
import 'package:univ_port_app/globals.dart' as globals;
import 'package:univ_port_app/student.dart';
import 'package:univ_port_app/university_user.dart';

import 'app_drawer.dart';
import 'custom_appbar.dart';
import 'dashboard/dashboard_details.dart';
import 'dashboard/upcomings.dart';

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

  @override
  void initState() {
    super.initState();
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .where('uid', isEqualTo: globals.reduxStore.state.user!.firebaseUser.uid)
    //     .get()
    //     .then((documentSnapshot) {
    //   if (documentSnapshot.docs.isNotEmpty) {
    //     if (documentSnapshot.docs[0].data().containsKey('isStudent')) {
    //       isStudent = documentSnapshot.docs[0]['isStudent'];
    //     }
    //     if (documentSnapshot.docs[0].data().containsKey('totalEarnedHours')) {
    //       totalEarnedHours = documentSnapshot.docs[0]['totalEarnedHours'];
    //     }
    //     if (documentSnapshot.docs[0].data().containsKey('displayName')) {
    //       username = documentSnapshot.docs[0]['displayName'];
    //     }
    //   }
    // }).catchError((error) {
    //   if (kDebugMode) {
    //     print(error);
    //   }
    // });
  }

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

        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('users')
              .where('uid', isEqualTo: globals.reduxStore.state.user!.firebaseUser.uid)
              .get(),
          builder: (context, snapshot) {
            // if (documentSnapshot.docs.isNotEmpty) {
            //   if (documentSnapshot.docs[0].data().containsKey('isStudent')) {
            //     isStudent = documentSnapshot.docs[0]['isStudent'];
            //   }
            //   if (documentSnapshot.docs[0].data().containsKey('totalEarnedHours')) {
            //     totalEarnedHours = documentSnapshot.docs[0]['totalEarnedHours'];
            //   }
            //   if (documentSnapshot.docs[0].data().containsKey('displayName')) {
            //     username = documentSnapshot.docs[0]['displayName'];
            //   }
            // }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Error fetching notes');
              } else {
                if (snapshot.data!.docs.isNotEmpty) {
                  final userDoc = snapshot.data!.docs[0];

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
                    if (userDoc.data().containsKey('totalEarnedHours')) {
                      courses = //userDoc.data()['courses'];
                          () {
                        List<Course> r = [];
                        for (var i = 0; i < userDoc.data()['courses'].length; i++) {
                          r.add(Course(code: '', fullName: userDoc.data()['courses'][i]));
                        }
                        return r;
                      }();
                    }

                    currentUser = Student(
                      displayName: displayName,
                      email: email,
                      earnedHours: totalEarnedHours,
                      courses: courses,
                    );
                  } else if (userDoc.data().containsKey('isAdmin') && userDoc.data()['isAdmin']) {
                    currentUser = AdminUser(
                      displayName: userDoc.data()['displayName'],
                      email: userDoc.data()['email'],
                    );
                  } else {
                    currentUser = Teacher(
                      displayName: userDoc.data()['displayName'],
                      email: userDoc.data()['email'],
                      courses: //userDoc.data()['courses'].map((c) => Course(code: 's', fullName: c)).toList() as List<Course>

                          () {
                        List<Course> r = [];
                        for (var i = 0; i < userDoc.data()['courses'].length; i++) {
                          r.add(Course(code: '', fullName: userDoc.data()['courses'][i]));
                        }
                        return r;
                      }(),
                      // courses: userDoc.data()['courses'].map((c) => Course(code: 's', fullName: c)).toList() as List<Course>,
                    );
                  }

                  return SingleChildScrollView(child: () {
                    if (isSmallScreen) {
                      return Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(fit: FlexFit.loose, child: DashboardDetails(user: currentUser)),
                            const SizedBox(height: 10.0),
                            () {
                              if (userDoc.data().containsKey('isStudent') && userDoc.data()['isStudent']) {
                                return const Flexible(fit: FlexFit.loose, child: Upcomings());
                              }
                              return Container();
                            }(),
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                                flex: 5,
                                fit: FlexFit.loose,
                                child: DashboardDetails(
                                  user: currentUser,
                                )),
                            const SizedBox(width: 15.0),
                            () {
                              if (userDoc.data().containsKey('isStudent') && userDoc.data()['isStudent']) {
                                return const Flexible(fit: FlexFit.loose, child: Upcomings());
                              }
                              return Container();
                            }(),
                          ],
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
        // ),
      ),
    );
  }
}
