import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/app_redux/actions.dart';
import 'package:univ_port_app/globals.dart' as globals;
import 'package:univ_port_app/models/courses.dart';
import 'package:univ_port_app/models/teachers.dart';

class CoursesListForTeacherDashboard extends StatefulWidget {
  final Teacher teacher;
  const CoursesListForTeacherDashboard({super.key, required this.teacher});

  @override
  State<CoursesListForTeacherDashboard> createState() => _CoursesListForTeacherDashboardState();
}

class _CoursesListForTeacherDashboardState extends State<CoursesListForTeacherDashboard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('courses').where('teacherId', isEqualTo: widget.teacher.uid).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error fetching user\'s data');
            } else if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
              List<Widget> children = [];
              List<Course> courses = snapshot.data!.docs
                  .map((e) => Course(
                        code: e.data()['code'],
                        fullName: e.data()['fullName'],
                        teacherId: e.data()['teacherId'],
                      ))
                  .toList();
              for (var i = 0; i < courses.length; i++) {
                children.add(Card(
                  elevation: 2.0,
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(text: 'Course: ', style: TextStyle(fontWeight: FontWeight.normal)),
                          TextSpan(
                            text: ' ${courses[i].code} - ${courses[i].fullName}',
                            style: const TextStyle(color: Colors.indigo, fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                    // subtitle: Text('Dr. ${() {
                    //   final Faker faker = Faker();
                    //   return faker.person.name();
                    // }()}'),
                    leading: SizedBox(
                      width: 80.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7.0),
                        child: Image(
                          image: NetworkImage(() {
                            final Faker faker = Faker();
                            return faker.image.image(keywords: ['computer science', 'college', 'course'], random: true);
                          }()),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        // setState(() {
                        //   _editState = true;
                        // });

                        globals.reduxStore.dispatch(SetNavigationPayloadAction(courses[i]));
                        globals.reduxStore.dispatch(NavigateToUrlAction('/course'));
                      },
                      icon: const Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                ));
                if (i < courses.length - 1) {
                  children.add(const SizedBox(height: 10));
                }
              }
              return Column(
                children: [
                  const Text('Your Courses:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ...children,
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
  }
}
