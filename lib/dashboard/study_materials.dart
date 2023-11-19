import 'package:flutter/material.dart';

class StudyMaterials extends StatelessWidget {
  const StudyMaterials({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // IntrinsicHeight(
        // child:
        Material(
      elevation: 4.0,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: Colors.blue[50],
      child: Container(
        height: 220.0,
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        child: Column(
          children: [
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
                    IconButton(onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
                    // SizedBox(width: 5.0),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.download))
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
                    IconButton(onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
                    // SizedBox(width: 5.0),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.download))
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
                    IconButton(onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
                    // SizedBox(width: 5.0),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.download))
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
    )

        // ,
        // )
        ;
  }
}
