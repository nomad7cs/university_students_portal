import 'package:flutter/material.dart';

class UpCommingAssignments extends StatefulWidget {
  const UpCommingAssignments({super.key});

  @override
  State<UpCommingAssignments> createState() => _UpCommingAssignmentsState();
}

class _UpCommingAssignmentsState extends State<UpCommingAssignments> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: Icon(Icons.check_box),
            title: Text('AI 220 Assignment',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            subtitle: Text('29/10/2023',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
            ),
            trailing: IconButton(icon: Icon(Icons.keyboard_arrow_right_rounded), onPressed: (){}),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.check_box_outline_blank),
            title: Text('CS 320 Assingment',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            subtitle: Text('1/11/2023',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
            ),
            trailing: IconButton(icon: Icon(Icons.keyboard_arrow_right_rounded), onPressed: (){}),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.check_box_outline_blank),
            title: Text('Math 250 Assignment',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            subtitle: Text('3/11/2023',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
            ),
            trailing: IconButton(icon: Icon(Icons.keyboard_arrow_right_rounded), onPressed: (){}),
          ),
        ),
        SizedBox(height: 10),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            // side: const BorderSide(color: Colors.red, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {},
          child: const Text('See All of The Assignments'),
        ),
      ],
    );
  }
}
