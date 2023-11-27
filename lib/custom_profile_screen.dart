import 'dart:async';

import 'package:flutter/material.dart';
import 'package:univ_port_app/app_drawer.dart';
import 'package:univ_port_app/app_redux/actions.dart';
import 'package:univ_port_app/custom_appbar.dart';
import 'package:univ_port_app/earnedHours.dart';
import 'package:univ_port_app/globals.dart' as globals;
import 'package:univ_port_app/usertype.dart';

class CustomProfileScreen extends StatefulWidget {
  const CustomProfileScreen({super.key});

  @override
  State<CustomProfileScreen> createState() => _CustomProfileScreenState();
}

class _CustomProfileScreenState extends State<CustomProfileScreen> {
  late StreamSubscription _subscription;
  bool? _editingUser = false;
  String? _username;
  int? _totalEarnedHours;

  @override
  void initState() {
    super.initState();
    if (globals.reduxStore.state.isStudent == null) {
      globals.reduxStore.dispatch(FetchExtraUserInfoAction(uid: globals.reduxStore.state.user!.firebaseUser.uid));
    }
    _subscription = globals.reduxStore.onChange.listen((event) {
      setState(() {
        _editingUser = event.editingUser;
        _username = event.user?.firebaseUser.displayName ?? '';
        _totalEarnedHours = event.totalEarnedHours ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
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
            Flexible(
              child: Text(
                'Name: $_username',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            const Divider(),
            /* ************************************************************************************************************ */
            Flexible(
                flex: 0,
                child: Row(
                  children: [
                    const Spacer(),
                    if (_editingUser != true)
                      Flexible(
                        flex: 0,
                        child: IconButton(
                          onPressed: () {
                            globals.reduxStore.dispatch(ToggleEditingUserAction(true));
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ),
                    const SizedBox(height: 10.0),
                    if (_editingUser == true)
                      Flexible(
                        flex: 0,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  globals.reduxStore.dispatch(SaveUserDataAction());
                                },
                                icon: const Icon(Icons.save)),
                            IconButton(
                                onPressed: () {
                                  globals.reduxStore.dispatch(ToggleEditingUserAction(false));
                                },
                                icon: const Icon(Icons.cancel)),
                          ],
                        ),
                      ),
                    const Spacer(),
                  ],
                )),
            () {
              if (_editingUser == true) {
                return const Flexible(flex: 0, child: EditUserType());
              } else {
                return const Flexible(flex: 0, child: UserType());
              }
            }(),
            const SizedBox(height: 10.0),
            () {
              if (_editingUser == true) {
                return const Flexible(flex: 0, child: SetEarnedHours());
              } else {
                return Flexible(
                    flex: 0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Total Earned Hours: $_totalEarnedHours'),
                      ],
                    ));
              }
            }(),
          ],
        ),
      ),
    );
  }
}
