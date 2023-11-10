import 'package:flutter/material.dart';

class ClassScheduleCard extends StatefulWidget {
  final String className;  // e.g 'Theory of Computation - CS 110'
  final String teacherName;  // e.g. 'Dr. Amr Ali Alaraby'
  final String schedule;  // e.g. '10:00 - SS 102'
  final String picturePath;  // e.g. 'assets/img/ss2.jpg'
  final String duration;  // format: '3 Hours'
  final String participants;
  final String credit;  // '3 Credit' or 0 Credit

  const ClassScheduleCard(
      {super.key,
      required this.className,
      required this.teacherName,
      required this.schedule,
      required this.picturePath,
      required this.duration,
      required this.participants,
      required this.credit});

  @override
  State<ClassScheduleCard> createState() => _ClassScheduleCardState();
}

class _ClassScheduleCardState extends State<ClassScheduleCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue[50],
      elevation: 4.0,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 70.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7.0),
                        child: Image(
                          image: AssetImage(widget.picturePath),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text(widget.className),
                        Text(widget.teacherName),
                      ],
                    )
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
              ],
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 5),
                      Text(widget.schedule),
                    ],
                  ),
                ),
                SizedBox(width: 50),
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      Icon(Icons.description),
                      SizedBox(width: 5),
                      Text(widget.credit),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(Icons.group),
                      SizedBox(width: 5),
                      Text(widget.participants),
                    ],
                  ),
                ),
                SizedBox(width: 50),
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      Icon(Icons.timelapse),
                      SizedBox(width: 5),
                      Text(widget.duration),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
