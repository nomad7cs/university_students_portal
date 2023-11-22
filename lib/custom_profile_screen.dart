import 'package:flutter/material.dart';
import 'package:univ_port_app/app_drawer.dart';
import 'package:univ_port_app/app_redux/actions.dart';
import 'package:univ_port_app/app_redux/app_state.dart';
import 'package:univ_port_app/custom_appbar.dart';
import 'package:univ_port_app/globals.dart' as globals;
import 'package:univ_port_app/teacher_or_student.dart';

class CustomProfileScreen extends StatefulWidget {
  const CustomProfileScreen({super.key});

  @override
  State<CustomProfileScreen> createState() => _CustomProfileScreenState();
}

class _CustomProfileScreenState extends State<CustomProfileScreen> {
  bool _edit = false;
  int? _choice;

  @override
  void initState() {
    super.initState();
    globals.reduxStore.dispatch(FetchExtraUserInfoAction(uid: globals.reduxStore.state.user!.firebaseUser.uid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: const AssetImage('assets/img/default-avatar-profile-icon-vector.jpg'),
                backgroundColor: Colors.brown.shade800,
              ),
            ),
            const Flexible(
              child: Text(
                'Hossam Ramzy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              flex: 0,
              child: StreamBuilder<MyAppState>(
                stream: globals.reduxStore.onChange,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        snapshot.data!.editingUserType! ? EditTeacherOrStudent() : TeacherOrStudent(),
                        // const Spacer(),
                        // if (snapshot.data!.editingUserType != null && snapshot.data!.editingUserType == true)
                        //   EditTeacherOrStudent(),
                        // if (snapshot.data!.editingUserType == null || snapshot.data!.editingUserType == false)
                        //   TeacherOrStudent(),
                        // StreamBuilder<bool?>(
                        //   stream: globals.reduxStore.onChange.map((event) => event.editIsStudent),
                        //   builder: (context, snapshot) {
                        //     if (!snapshot.hasData || snapshot.data == null) {
                        //     } else if (snapshot.data == true) {
                        //       return EditTeacherOrStudent();
                        //     }
                        //     return TeacherOrStudent();
                        //   },
                        // ),
                        const SizedBox(width: 25.0),
                        const SizedBox(height: 25.0, child: VerticalDivider(thickness: 1, color: Colors.black)),
                        const SizedBox(width: 25.0),
                        Flexible(
                          flex: 0,
                          child: snapshot.data!.editingUserType!
                              ? Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          globals.reduxStore.dispatch(SaveIsStudentAction());
                                          // globals.reduxStore.dispatch(
                                          //     FetchExtraUserInfoAction(uid: globals.reduxStore.state.user!.firebaseUser.uid));
                                          // setState(() {
                                          //   _edit = false;
                                          // });
                                        },
                                        icon: Icon(Icons.save)),
                                    IconButton(
                                        onPressed: () {
                                          // globals.reduxStore.dispatch(SaveIsStudentAction());
                                          globals.reduxStore.dispatch(ToggleEditingUserTypeAction());
                                          // setState(() {
                                          //   _edit = false;
                                          // });
                                        },
                                        icon: Icon(Icons.cancel)),
                                  ],
                                )
                              : IconButton(
                                  onPressed: () {
                                    globals.reduxStore.dispatch(ToggleEditingUserTypeAction());

                                    // setState(() {
                                    //   _edit = !_edit;
                                    // });
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                        ),
                        const Spacer(),
                      ],
                    );
                  }
                  return Placeholder();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
