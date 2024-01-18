import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/Teacher.dart';
import 'package:univ_port_app/app_redux/actions.dart';
import 'package:univ_port_app/course.dart';
import 'package:univ_port_app/dashboard/greetings.dart';
import 'package:univ_port_app/dashboard/today_classes.dart';
import 'package:univ_port_app/globals.dart' as globals;
import 'package:univ_port_app/student.dart';
import 'package:univ_port_app/university_user.dart';

import 'student_summary.dart';
import 'study_materials.dart';

class DashboardDetails extends StatefulWidget {
  final UniversityUser user;
  const DashboardDetails({super.key, required this.user});

  @override
  State<DashboardDetails> createState() => _DashboardDetailsState();
}

class _DashboardDetailsState extends State<DashboardDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DashboardGreetings(user: widget.user),
        const SizedBox(height: 10.0),
        ...() {
          if (widget.user is Student) {
            return [
              const Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(child: StudyMaterials()),
                  SizedBox(width: 10.0),
                  Flexible(child: StudentSummary()),
                ],
              ),
              const SizedBox(height: 10.0),
              TodayClasses(student: widget.user as Student),
            ];
          } else if (widget.user is Teacher) {
            return [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Flexible(child: StudyMaterials()),
                  const SizedBox(width: 10.0),
                  Flexible(
                      child: Material(
                    elevation: 4.0,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue[50],
                    child: Column(
                      children: [
                        const Text('Your Courses:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Courses(courses: (widget.user as Teacher).courses!),
                      ],
                    ),
                  )),
                ],
              )
            ];
          } else if (widget.user is AdminUser) {
            return [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      globals.reduxStore.dispatch(NavigateToUrlAction('/admin'));
                    },
                    child: const Text('Edit Students data'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      globals.reduxStore.dispatch(NavigateToUrlAction('/admin'));
                    },
                    child: const Text('Edit Teachers data'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      globals.reduxStore.dispatch(NavigateToUrlAction('/projects'));
                    },
                    child: const Text('Edit Projects data'),
                  ),
                ],
              )
            ];
          } else {
            return [Container()];
          }
        }(),
      ],
    );
  }
}

/*

class _DashboardDetailsState extends State<DashboardDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashboardGreetings(),
        Row(
          children: [
            // TodayClasses(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Summary')],
                ),
                StudentSummary(),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Column(),
            Column(),
          ],
        ),
      ],
    );
  }
}

* */

class Courses extends StatefulWidget {
  final List<Course> courses;
  const Courses({super.key, required this.courses});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.courses.length,
      itemBuilder: (context, index) {
        // final userDoc = usersDocs[index];
        // return Placeholder();
        return CourseListCard(course: widget.courses[index]);
      },
    );
  }
}

class CourseListCard extends StatelessWidget {
  final Course course;
  const CourseListCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    // return Text(course.fullName);
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Text('Course: ${course.code != null ? course.code : ''} - ${course.fullName != null ? course.fullName : ''}'),
        subtitle: Text('Dr. ${() {
          final Faker faker = Faker();
          return faker.person.name();
        }()}'),
        leading: SizedBox(
          width: 80.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: Image(
              image: NetworkImage(() {
                final Faker faker = Faker();
                return faker.image.image(keywords: ['computer', 'science', 'subject'], random: true);
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
          },
          icon: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
