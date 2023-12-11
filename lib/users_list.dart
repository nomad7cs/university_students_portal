import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/user_list_card.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  late Future _users;

  @override
  void initState() {
    super.initState();
    _users = FirebaseFirestore.instance.collection('users').where('isStudent', isEqualTo: true).get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _users,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error fetching users');
            } else {
              final usersDocs = snapshot.data!.docs;
              // print('\x1B[31m ------------------- users:\x1B[0m ${snapshot.data.docs[0]['totalEarnedHours']}');
              return ListView.builder(
                itemCount: usersDocs.length,
                itemBuilder: (BuildContext context, int index) {
                  final userDoc = usersDocs[index];
                  return UserListCard(user: userDoc);
                },
              );
            }
          } else {
            return const Text('Unknown error, fetching users');
          }
        });
  }
}
