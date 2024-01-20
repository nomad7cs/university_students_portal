import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/admin/course_editing_list_card.dart';
import 'package:univ_port_app/app_drawer.dart';
import 'package:univ_port_app/custom_appbar.dart';
import 'package:univ_port_app/models/courses.dart';

class EditCourses extends StatefulWidget {
  const EditCourses({super.key});

  @override
  State<EditCourses> createState() => _EditCoursesState();
}

class _EditCoursesState extends State<EditCourses> {
  @override
  Widget build(BuildContext context) {
    Future<QuerySnapshot<Map<String, dynamic>>> _courses = FirebaseFirestore.instance.collection('courses').get();
    // List<Course> courses = [];
    // final MediaQueryData mediaQuery = MediaQuery.of(context);
    // final bool isSmallScreen = mediaQuery.size.width < 600.0;
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text('All Courses\n', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                Flexible(
                  child: FutureBuilder(
                    future: _courses,
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return const Text('Error fetching courses');
                        } else {
                          if (snapshot.data != null && snapshot.data!.size > 0 && snapshot.data!.docs.isNotEmpty) {
                            final List<QueryDocumentSnapshot<Map<String, dynamic>>> coursesDocs = snapshot.data!.docs;
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: coursesDocs.length,
                              itemBuilder: (context, index) {
                                // final userDoc = usersDocs[index];
                                // return Placeholder();
                                return CourseEditingListCard(
                                  course: Course(
                                    id: coursesDocs[index].id,
                                    code: coursesDocs[index].data()['code'],
                                    fullName: coursesDocs[index].data()['fullName'],
                                    teacherId: coursesDocs[index].data()['teacherId'],
                                    // img: '',
                                  ),
                                );
                              },
                            );
                          }
                          return const Text('Unknown error, fetching courses');
                        }
                      } else {
                        return const Text('Unknown error, fetching courses');
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class CoursesList extends StatefulWidget {
//   final List<Course> courses;
//   const CoursesList({super.key, required this.courses});
//
//   @override
//   State<CoursesList> createState() => _CoursesListState();
// }
//
// class _CoursesListState extends State<CoursesList> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: widget.courses.length,
//       itemBuilder: (context, index) {
//         // final userDoc = usersDocs[index];
//         // return Placeholder();
//         return CourseListCard(course: widget.courses[index]);
//       },
//     );
//   }
// }
