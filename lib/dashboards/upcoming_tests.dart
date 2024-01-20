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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
            child: Container(
          margin: EdgeInsets.all(4.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue[50],
              border: Border.all(width: 0.5, color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  offset: Offset(0.0, 1.0),
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.all(3.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CS 450 Exam',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      Text(
                        '11/12/2023',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
                      ),
                    ],
                  )),
                  Flexible(child: IconButton(icon: const Icon(Icons.keyboard_arrow_right_rounded), onPressed: () {}))
                ],
              ),
            ),
          ),
        )),
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
        Flexible(
          child: Card(
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
        ),
        Flexible(
          child: Card(
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
