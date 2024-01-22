import 'package:flutter/material.dart';

import 'upcoming_assignments.dart';
import 'upcoming_tests.dart';

class Upcomings extends StatefulWidget {
  const Upcomings({super.key});

  @override
  State<Upcomings> createState() => _UpcomingsState();
}

class _UpcomingsState extends State<Upcomings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_month),
                SizedBox(width: 10.0),
                Text(
                  'Upcomings',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Upcoming Tests',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          Flexible(child: UpComingTests()),
          SizedBox(height: 5),
          Divider(),
          SizedBox(height: 5),
          Text(
            'Assignments',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          Flexible(child: UpComingAssignments()),
        ],
      ),
    );
  }
}
