import 'package:flutter/material.dart';
import 'package:univ_port_app/dashboards/greetings.dart';
import 'package:univ_port_app/dashboards/students/course_materials_list_for_students.dart';
import 'package:univ_port_app/dashboards/today_classes.dart';
import 'package:univ_port_app/models/students.dart';

import '../student_summary.dart';

class StudentDashboard extends StatefulWidget {
  final Student student;
  const StudentDashboard({super.key, required this.student});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DashboardGreetings(user: widget.student),
        Flexible(
          fit: FlexFit.loose,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(flex: 3, fit: FlexFit.loose, child: CourseMaterialsListForStudents()),
              const SizedBox(width: 10.0),
              Flexible(flex: 1, fit: FlexFit.loose, child: StudentSummary(studentUid: widget.student.uid)),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        TodayClasses(user: widget.student),
      ],
    );
  }
}
