import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:univ_port_app/models/course_material.dart';

class CourseMaterialsListEntryForTeachers extends StatelessWidget {
  final CourseMaterial courseMaterial;
  const CourseMaterialsListEntryForTeachers({super.key, required this.courseMaterial});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: Row(
          children: [
            const Icon(Icons.picture_as_pdf),
            const SizedBox(width: 5.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(courseMaterial.fileName),
                RichText(
                    text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(text: 'Upload date: ', style: TextStyle(fontWeight: FontWeight.normal)),
                    TextSpan(
                        text: () {
                          DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm a');
                          return formatter.format(courseMaterial.uploadDate);
                        }(),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                          color: Colors.grey[700],
                        )),
                  ],
                )),
                // Text(
                //   () {
                //     DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm a');
                //     return 'Upload date: ${formatter.format(courseMaterial.uploadDate)}';
                //   }(),
                //   style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
                // )
              ],
            ),
          ],
        )),
        Flexible(
            flex: 0,
            fit: FlexFit.loose,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CourseCodeForCourseMaterialsListEntry(courseId: courseMaterial.courseId),
                // SizedBox(width: 5.0),
                // Chip(
                //   avatar: CircleAvatar(backgroundImage: NetworkImage(() {
                //     final Faker faker = Faker();
                //     return faker.image.image(keywords: [
                //       'account',
                //       'male',
                //     ], random: true);
                //   }())),
                //   label: Text(() {
                //     final Faker faker = Faker();
                //     return faker.person.name();
                //   }()),
                // ),
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
            Material(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                color: Colors.blue[50],
                child: IconButton(onPressed: () {}, icon: const Icon(Icons.delete))),
          ],
        )),
      ],
    );
  }
}

class CourseCodeForCourseMaterialsListEntry extends StatefulWidget {
  final String courseId;
  const CourseCodeForCourseMaterialsListEntry({super.key, required this.courseId});

  @override
  State<CourseCodeForCourseMaterialsListEntry> createState() => _CourseCodeForCourseMaterialsListEntryState();
}

class _CourseCodeForCourseMaterialsListEntryState extends State<CourseCodeForCourseMaterialsListEntry> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance.doc('/courses/${widget.courseId}').get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          // List<Widget> children;

          if (snapshot.hasData && snapshot.data!.exists) {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Text(snapshot.data!.data()!['code']),
            );
          } else if (snapshot.hasError) {
            // children = <Widget>[
            return const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            );
            //   Padding(
            //     padding: const EdgeInsets.only(top: 16),
            //     child: Text('Error: ${snapshot.error}'),
            //   ),
            // ];
          } else {
            // children = const <Widget>[
            return SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            );
            //   Padding(
            //     padding: EdgeInsets.only(top: 16),
            //     child: Text('Awaiting result...'),
            //   ),
            // ];
          }
          return Container();
        });
  }
}
