import 'package:flutter/material.dart';

import 'upcomming_assignments.dart';
import 'upcomming_tests.dart';


class Upcommings extends StatefulWidget {
  const Upcommings({super.key});

  @override
  State<Upcommings> createState() => _UpcommingsState();
}

class _UpcommingsState extends State<Upcommings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calendar_month),
              SizedBox(width: 10.0),
              Text('Upcomings',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text('Upcoming Tests',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          UpCommingTests(),
          SizedBox(height: 5),
          Divider(),
          SizedBox(height: 5),
          Text('Assignments',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          UpCommingAssignments(),
        ],
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';

import 'upcomming_assignments.dart';
import 'upcomming_tests.dart';


class Upcommings extends StatefulWidget {
  const Upcommings({super.key});

  @override
  State<Upcommings> createState() => _UpcommingsState();
}

class _UpcommingsState extends State<Upcommings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: IntrinsicHeight(
        child: Column(
          children: [
            Expanded(child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_month),
                Text('Upcomings'),
              ],
            )),
            Text('Upcoming Tests'),
            // UpCommingTests(),
            // Text('Assignments'),
            // UpCommingAssignments(),
          ],
        ),
      ),
    );
  }
}

* */