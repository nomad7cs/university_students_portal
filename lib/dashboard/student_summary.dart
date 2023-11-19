import 'package:flutter/material.dart';

class StudentSummary extends StatelessWidget {
  const StudentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 4.0,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.blue[50],
        child: Container(
          padding: const EdgeInsets.all(2.0),
          height: 220.0,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   alignment: Alignment.center,
              Text(
                'Summary',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ), //   child: Text('Summary'),
              // ),
              SizedBox(width: 20.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.stacked_line_chart),
                  SizedBox(
                    height: 25.0,
                  ),
                  Icon(Icons.grade_outlined),
                ],
              ),
              SizedBox(width: 5.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('3.75'),
                  Text('GPA'),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('137'),
                  Text('Total Credit'),
                ],
              )
              // StudentSummary(),
            ],
          ),
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
