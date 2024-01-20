import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentSummary extends StatefulWidget {
  final String studentUid;
  const StudentSummary({super.key, required this.studentUid});

  @override
  State<StudentSummary> createState() => _StudentSummaryState();
}

class _StudentSummaryState extends State<StudentSummary> {
  // int gpa = 0;
  // int hours = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 4.0,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.blue[50],
        child: Container(
          padding: const EdgeInsets.all(2.0),
          height: 220.0,
          child: FutureBuilder(
              future: FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: widget.studentUid).get(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error fetching user\'s data');
                  } else if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
                    final student = snapshot.data!.docs[0];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Container(
                        //   alignment: Alignment.center,
                        const Text(
                          'Summary',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                        ), //   child: Text('Summary'),
                        // ),
                        const SizedBox(width: 20.0),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.stacked_line_chart),
                            SizedBox(
                              height: 25.0,
                            ),
                            Icon(Icons.grade_outlined),
                          ],
                        ),
                        const SizedBox(width: 5.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(student['gpa'].toString()),
                            const Text('GPA'),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Text(student['totalEarnedHours'].toString()),
                            const Text('Total Credit'),
                          ],
                        )
                        // StudentSummary(),
                      ],
                    );
                  } else {
                    return const Text('Unknown Error');
                  }
                } else {
                  return const Text('Unknown error');
                }
              }),
        ));
  }
}

/*
[
        ListTile(
          leading: Icon(Icons.stacked_line_chart),
          title: Text('3.75'),
          subtitle: Text('GPA'),
        ),
        ListTile(
          leading: Icon(Icons.grade_outlined),
          title: Text('137'),
          subtitle: Text('Total Credit'),
        ),
      ]
* */
