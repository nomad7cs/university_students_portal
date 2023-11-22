import 'package:flutter/material.dart';
import 'package:univ_port_app/add_remove_classrooms.dart';
import 'package:univ_port_app/app_drawer.dart';
import 'package:univ_port_app/custom_appbar.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(100),
      //   child: CustomAppBar(),
      // ),
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text('Proof of Concept', textAlign: TextAlign.center),
            Text('Add/Remove Classes', textAlign: TextAlign.center),
            AddRemoveClassroomForm(),
          ],
        ),
      ),
    );
  }
}
