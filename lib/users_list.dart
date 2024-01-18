import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/user_list_card.dart';

class StudentsList extends StatefulWidget {
  const StudentsList({super.key});

  @override
  State<StudentsList> createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  late Future _students;

  @override
  void initState() {
    super.initState();
    _students = FirebaseFirestore.instance.collection('users').where('isStudent', isEqualTo: true).get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _students,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error fetching Students');
            } else {
              // print('\x1B[31m ------------------- users:\x1B[0m ${snapshot.data.docs[0]['totalEarnedHours']}');
              if (snapshot.data != null && snapshot.data.docs.length > 0) {
                final usersDocs = snapshot.data.docs;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: usersDocs.length,
                  itemBuilder: (context, index) {
                    // final userDoc = usersDocs[index];
                    // return Placeholder();
                    return StudentListCard(user: usersDocs[index]);
                  },
                );
              }
              return const Text('Unknown error, fetching students');
            }
          } else {
            return const Text('Unknown error, fetching students');
          }
        });
  }
}

class TeachersList extends StatefulWidget {
  const TeachersList({super.key});

  @override
  State<TeachersList> createState() => _TeachersListState();
}

class _TeachersListState extends State<TeachersList> {
  late Future _teachers;

  @override
  void initState() {
    super.initState();
    _teachers = FirebaseFirestore.instance.collection('users').where('isStudent', isEqualTo: false).get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _teachers,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error fetching teachers');
            } else {
              // print('\x1B[31m ------------------- users:\x1B[0m ${snapshot.data.docs[0]['totalEarnedHours']}');
              if (snapshot.data != null && snapshot.data.docs.length > 0) {
                final usersDocs = snapshot.data.docs;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: usersDocs.length,
                  itemBuilder: (context, index) {
                    // final userDoc = usersDocs[index];
                    // return Placeholder();
                    return TeacherListCard(user: usersDocs[index]);
                  },
                );
              }
              return const Text('Unknown error, fetching teachers');
            }
          } else {
            return const Text('Unknown error, fetching teachers');
          }
        });
  }
}
