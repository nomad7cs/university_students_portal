import 'package:flutter/material.dart';
import 'package:univ_port_app/class_sch_card.dart';

class TodayClasses extends StatelessWidget {
  const TodayClasses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: const Text('Today\'s Schedule',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
            ),
          ),
          ClassScheduleCard(
            className: 'Theory of Computation - CS 110',
            teacherName: 'Dr. Amr Ali Alaraby',
            schedule: '09:00 - SS 102 TH',
            picturePath: 'assets/img/ss2.jpg',
            duration: '3 Hours',
            participants: '33 Participants',
            credit: '3 Credit',
          ),
          SizedBox(
            height: 10,
          ),
          ClassScheduleCard(
            className: 'Intro to Algorithms - CS 260',
            teacherName: 'Dr. Shereef Negm',
            schedule: '12:30 - SS 110 TH',
            picturePath: 'assets/img/eliminating bias from algorithms.jpg',
            duration: '3 Hours',
            participants: '43 Participants',
            credit: '3 Credit',
          ),
          SizedBox(
            height: 10,
          ),
          ClassScheduleCard(
            className: 'Theory of Computation - CS 110',
            teacherName: 'Dr. Amr Ali Alaraby',
            schedule: '13:00 - SS 102 LB',
            picturePath: 'assets/img/Complexity-classes-diagram.jpg',
            duration: '1.5 Hours',
            participants: '24 Participants',
            credit: '0 Credit',
          ),
          SizedBox(
            height: 10,
          ),
          ClassScheduleCard(
            className: 'Operating Systems - CS 400',
            teacherName: 'Dr. Ahmad Abdallah',
            schedule: '16:00 - SS 202 TH',
            picturePath: 'assets/img/os-mini-logo.jpg',
            duration: '3 Hours',
            participants: '33 Participants',
            credit: '3 Credit',
          ),
        ],
      ),
    );
  }
}
