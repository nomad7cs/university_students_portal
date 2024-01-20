import 'package:flutter/material.dart';
import 'package:univ_port_app/dashboards/greetings.dart';
import 'package:univ_port_app/dashboards/today_classes.dart';
import 'package:univ_port_app/models/students.dart';

import 'student_summary.dart';
import 'study_materials.dart';

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
        const Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(child: StudyMaterials()),
            SizedBox(width: 10.0),
            Flexible(child: StudentSummary()),
          ],
        ),
        const SizedBox(height: 10.0),
        TodayClasses(user: widget.student),
      ],
    );
  }
}
