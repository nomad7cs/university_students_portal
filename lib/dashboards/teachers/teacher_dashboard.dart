import 'package:flutter/material.dart';
import 'package:univ_port_app/dashboards/greetings.dart';
import 'package:univ_port_app/dashboards/teachers/course_materials_list_for_teachers.dart';
import 'package:univ_port_app/dashboards/teachers/courses_list_for_teacher_dashboard.dart';
import 'package:univ_port_app/dashboards/today_classes.dart';
import 'package:univ_port_app/models/teachers.dart';

class TeacherDashboard extends StatelessWidget {
  final Teacher teacher;
  const TeacherDashboard({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DashboardGreetings(user: teacher),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Flexible(child: CourseMaterialsForTeacher(isStudent: false)),
            const SizedBox(width: 10.0),
            Flexible(
                child: Material(
              elevation: 4.0,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.blue[50],
              child: CoursesListForTeacherDashboard(teacher: teacher),
            )),
          ],
        ),
        const SizedBox(height: 10.0),
        TodayClasses(user: teacher),
      ],
    );
  }
}
