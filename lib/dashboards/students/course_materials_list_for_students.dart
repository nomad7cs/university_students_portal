import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/dashboards/students/course_materials_list_entry_for_students.dart';
import 'package:univ_port_app/globals.dart' as globals;
import 'package:univ_port_app/models/course_material.dart';

class CourseMaterialsListForStudents extends StatefulWidget {
  const CourseMaterialsListForStudents({super.key});

  @override
  State<CourseMaterialsListForStudents> createState() => _CourseMaterialsListForStudentsState();
}

class _CourseMaterialsListForStudentsState extends State<CourseMaterialsListForStudents> {
  // late List<Course> courses;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection('courses')
  //       .where('students', arrayContains: globals.reduxStore.state.user!.firebaseUser.uid)
  //       .get()
  //       .then((courseDocs) {
  //     for (var courseDoc in courseDocs.docs) {
  //       courses.add(Course(
  //         teacherId: courseDoc.data()['teacherId'],
  //         fullName: courseDoc.data()['fullName'],
  //         code: courseDoc.data()['code'],
  //       ));
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: Colors.blue[50],
      child: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('courseMaterials')
                .where('students', arrayContains: globals.reduxStore.state.user!.firebaseUser.uid)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              List<Widget> children = [];
              if (snapshot.hasError) {
                children = <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text('Stack trace: ${snapshot.stackTrace}'),
                  ),
                ];
              } else {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    children = const <Widget>[
                      Icon(
                        Icons.info,
                        color: Colors.blue,
                        size: 60,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Error initializing the widget!!'),
                      ),
                    ];
                  case ConnectionState.waiting:
                    children = const <Widget>[
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Fetching courses...'),
                      ),
                    ];
                  case ConnectionState.active:
                    List<CourseMaterial> courseMaterials = snapshot.data!.docs
                        .map((courseDoc) => CourseMaterial(
                              fileName: courseDoc.data()['fileName'],
                              uploadDate: courseDoc.data()['uploadDate'].toDate(),
                              courseId: courseDoc.data()['courseId'],
                              teacherId: courseDoc.data()['teacherId'],
                            ))
                        .toList();
                    children.add(const Text('Materials:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
                    children.add(const SizedBox(height: 10.0));
                    for (var i = 0; i < courseMaterials.length; i++) {
                      children.add(Flexible(child: CourseMaterialsListEntryForStudents(courseMaterial: courseMaterials[i])));
                      if (i != courseMaterials.length - 1) {
                        children.add(const Divider());
                      }
                    }

                  case ConnectionState.done:
                    children = <Widget>[
                      const Icon(
                        Icons.info,
                        color: Colors.blue,
                        size: 60,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Connection Lost!!'),
                      ),
                    ];
                }
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: children,
              );
            }),
      ),
    );
  }
}
