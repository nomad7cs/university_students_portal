import 'package:flutter/material.dart';

class UpComingTests extends StatefulWidget {
  const UpComingTests({super.key});

  @override
  State<UpComingTests> createState() => _UpComingTestsState();
}

class _UpComingTestsState extends State<UpComingTests> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            // leading: Icon(Icons.keyboard_arrow_right_rounded),
            title: const Text(
              'CS 450 Exam',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            subtitle: Text(
              '11/12/2023',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
            ),
            trailing: IconButton(icon: const Icon(Icons.keyboard_arrow_right_rounded), onPressed: () {}),
          ),
        ),
        Card(
          child: ListTile(
            // leading: Icon(Icons.keyboard_arrow_right_rounded),
            title: const Text(
              'CS 320 Exam',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            subtitle: Text(
              '12/12/2023',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
            ),
            trailing: IconButton(icon: const Icon(Icons.keyboard_arrow_right_rounded), onPressed: () {}),
          ),
        ),
        Card(
          child: ListTile(
            // leading: Icon(Icons.keyboard_arrow_right_rounded),
            title: const Text(
              'ECE 350 Exam',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            subtitle: Text(
              '14/12/2023',
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
          child: const Text('See All Upcoming Tests'),
        ),
      ],
    );
  }
}
