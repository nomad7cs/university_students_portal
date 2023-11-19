import 'package:flutter/material.dart';
import 'package:univ_port_app/dashboard/greetings.dart';

import 'student_summary.dart';
import 'study_materials.dart';
import 'today_classes.dart';

class DashboardDetails extends StatefulWidget {
  const DashboardDetails({super.key});

  @override
  State<DashboardDetails> createState() => _DashboardDetailsState();
}

class _DashboardDetailsState extends State<DashboardDetails> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DashboardGreetings(),
        SizedBox(height: 10.0),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(child: StudyMaterials()),
            SizedBox(width: 10.0),
            Flexible(child: StudentSummary()),
          ],
        ),
        SizedBox(height: 10.0),
        TodayClasses(),
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
