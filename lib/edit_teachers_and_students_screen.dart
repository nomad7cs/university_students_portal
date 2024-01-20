import 'package:flutter/material.dart';
import 'package:univ_port_app/app_drawer.dart';
import 'package:univ_port_app/app_redux/app_state.dart';
import 'package:univ_port_app/custom_appbar.dart';
import 'package:univ_port_app/globals.dart' as globals;
import 'package:univ_port_app/users_list.dart';

class EditTeachersAndStudentsScreen extends StatefulWidget {
  const EditTeachersAndStudentsScreen({super.key});

  @override
  State<EditTeachersAndStudentsScreen> createState() => _EditTeachersAndStudentsScreenState();
}

class _EditTeachersAndStudentsScreenState extends State<EditTeachersAndStudentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(100),
      //   child: CustomAppBar(),
      // ),
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SafeArea(
        top: true,
        child: StreamBuilder<AppUser?>(
            stream: globals.reduxStore.onChange.map((state) => state.user),
            initialData: globals.reduxStore.state.user,
            builder: (BuildContext context, AsyncSnapshot<AppUser?> snapshot) {
              if ((snapshot.data != null) && (snapshot.data!.firebaseUser.email == 'test@test.com')) {
                // TODO: Add condition for certain users to use admin screen
                return Container(
                    padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
                    child: const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text('Students', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                              ),
                              Flexible(child: StudentsList()),
                            ],
                          ),
                        ),
                        Flexible(fit: FlexFit.loose, child: VerticalDivider()),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text('Teachers', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                              ),
                              Flexible(child: TeachersList()),
                            ],
                          ),
                        ),
                      ],
                    ));
              }
              return Container(padding: const EdgeInsets.fromLTRB(250, 5, 250, 5), child: const Text('You\'re not authorized'));
            }),
      ),
    );
  }
}
