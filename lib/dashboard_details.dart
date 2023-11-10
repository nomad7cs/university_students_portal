import 'package:flutter/material.dart';
import 'package:univ_port_app/greetings.dart';

import 'student_sammary.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DashboardGreetings(),
        SizedBox(height: 10.0),
        Row(
          mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: ,
          children: [
            Flexible(child: StudyMaterials()),
            SizedBox(width: 10.0),
            Flexible(child: StudentSummary()),
          ],
        ),
        SizedBox(height: 10.0),
        TodayClasses()
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Flexible(flex: 20, child: TodayClasses()),
        //     SizedBox(width: 15.0),
        //     Flexible(flex: 8, child: StudentSummary()),
        //   ],
        // ),
        ,
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
