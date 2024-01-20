import 'package:flutter/material.dart';

class UpComingAssignments extends StatefulWidget {
  const UpComingAssignments({super.key});

  @override
  State<UpComingAssignments> createState() => _UpComingAssignmentsState();
}

class _UpComingAssignmentsState extends State<UpComingAssignments> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.check_box),
            title: const Text(
              'AI 220 Assignment',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            subtitle: Text(
              '29/10/2023',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
            ),
            trailing: IconButton(icon: const Icon(Icons.keyboard_arrow_right_rounded), onPressed: () {}),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.check_box_outline_blank),
            title: const Text(
              'CS 320 Assignment',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            subtitle: Text(
              '1/11/2023',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
            ),
            trailing: IconButton(icon: const Icon(Icons.keyboard_arrow_right_rounded), onPressed: () {}),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.check_box_outline_blank),
            title: const Text(
              'Math 250 Assignment',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            subtitle: Text(
              '3/11/2023',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
            ),
            trailing: IconButton(icon: const Icon(Icons.keyboard_arrow_right_rounded), onPressed: () {}),
          ),
        ),
        const SizedBox(height: 10),
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
