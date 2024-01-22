import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:univ_port_app/dashboards/teachers/course_materials_list_entry_for_teachers.dart';
import 'package:univ_port_app/models/course_material.dart';

class CourseMaterialsListEntryForStudents extends StatelessWidget {
  final CourseMaterial courseMaterial;
  const CourseMaterialsListEntryForStudents({super.key, required this.courseMaterial});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: Row(
          children: [
            const Icon(Icons.picture_as_pdf),
            const SizedBox(width: 10),
            Flexible(
              fit: FlexFit.loose,
              child: Column(
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
          ],
        )),
      ],
    );
  }
}
