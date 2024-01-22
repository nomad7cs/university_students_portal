import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/app_drawer.dart';
import 'package:univ_port_app/custom_appbar.dart';
import 'package:univ_port_app/globals.dart' as globals;
import 'package:univ_port_app/models/courses.dart';
import 'package:univ_port_app/models/students.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Course targetCourse =
        globals.reduxStore.state.navigationPayload is Course ? globals.reduxStore.state.navigationPayload : null;
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Text(
                  () {
                    return targetCourse == null ? '' : '${targetCourse.code} - ${targetCourse.fullName}';
                  }(),
                ),
              ),
              const Flexible(child: Text('Students: ')),
              () {
                if (targetCourse.students != null) {
                  return FutureBuilder(
                      future: FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: 'ss').get(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return const Text('Error fetching students data');
                          } else if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
                            List<Student> students = snapshot.data!.docs
                                .map((e) => Student(uid: '', earnedHours: 0, email: '', displayName: ''))
                                .toList();
                            return Flexible(
                              child: Wrap(
                                children: [
                                  //
                                ],
                              ),
                            );
                            return Column(
                              children: [
                                const Text('Your Courses:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                // CoursesList(courses: courses),
                              ],
                            );
                          } else {
                            return const Text('No courses yet!');
                          }
                        } else {
                          return const Text('Unknown error');
                        }

                      });
                } else {
                  return Container();
                }
              }(),
            ],
          ),
        ),
      ),
    );
  }
}

//
/*
Chip(
  avatar: CircleAvatar(backgroundImage: NetworkImage(() {
    final Faker faker = Faker();
    return faker.image.image(keywords: [
      'account',
      'male',
    ], random: true);
  }())),
  label: Text(() {
    final Faker faker = Faker();
    return faker.person.name();
  }()),
),
* */
