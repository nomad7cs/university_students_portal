import 'package:flutter/material.dart';

class StudyMaterials extends StatelessWidget {
  const StudyMaterials({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: Colors.blue[50],
      child: Container(
        // height: 220.0,
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Materials:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Flexible(
                    child: Row(
                  children: [
                    const Icon(Icons.folder),
                    const SizedBox(width: 5.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('AI'),
                        Text(
                          '02, Feb, 2023',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                )),
                Flexible(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Material(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        color: Colors.blue[50],
                        child: IconButton(onPressed: () {}, icon: const Icon(Icons.remove_red_eye))),
                    const SizedBox(width: 5),
                    Material(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        color: Colors.blue[50],
                        child: IconButton(onPressed: () {}, icon: const Icon(Icons.download))),
                  ],
                )),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Flexible(
                    child: Row(
                  children: [
                    const Icon(Icons.folder),
                    const SizedBox(width: 5.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('OS'),
                        Text(
                          '02, Feb, 2023',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                )),
                Flexible(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Material(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        color: Colors.blue[50],
                        child: IconButton(onPressed: () {}, icon: const Icon(Icons.remove_red_eye))),
                    const SizedBox(width: 5),
                    Material(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        color: Colors.blue[50],
                        child: IconButton(onPressed: () {}, icon: const Icon(Icons.download))),
                  ],
                )),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Flexible(
                    child: Row(
                  children: [
                    const Icon(Icons.note),
                    const SizedBox(width: 5.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'InformationSecurity_Lec01.pdf',
                        ),
                        Text(
                          '04, Feb, 2023',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                )),
                Flexible(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Material(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        color: Colors.blue[50],
                        child: IconButton(onPressed: () {}, icon: const Icon(Icons.remove_red_eye))),
                    const SizedBox(width: 5),
                    Material(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        color: Colors.blue[50],
                        child: IconButton(onPressed: () {}, icon: const Icon(Icons.download))),
                  ],
                )),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.expand_more),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
