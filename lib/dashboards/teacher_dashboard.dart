import 'package:flutter/material.dart';
import 'package:univ_port_app/dashboards/courses/courses.dart';
import 'package:univ_port_app/dashboards/greetings.dart';
import 'package:univ_port_app/dashboards/study_materials.dart';
import 'package:univ_port_app/dashboards/today_classes.dart';
import 'package:univ_port_app/models/teachers.dart';

class TeacherDashboard extends StatefulWidget {
  final Teacher teacher;
  const TeacherDashboard({super.key, required this.teacher});

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DashboardGreetings(user: widget.teacher),
        Row(
          mainAxisSize: MainAxisSize.max,
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
                  CoursesList(courses: (widget.teacher).courses!),
                ],
              ),
            )),
          ],
        ),
        const SizedBox(height: 10.0),
        TodayClasses(user: widget.teacher),
      ],
    );
  }
}
