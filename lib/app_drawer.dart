import 'dart:async';

import 'package:flutter/material.dart';
import 'package:univ_port_app/globals.dart' as globals;

import 'app_redux/actions.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late StreamSubscription _subscription;
  String? _username;

  @override
  void initState() {
    super.initState();
    _subscription = globals.reduxStore.onChange.listen((event) {
      setState(() {
        _username = event.user?.firebaseUser.displayName;
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
    print('\x1B[31mBuilding appdrawer\x1B[0m');
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 25, 47, 89),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: const AssetImage('assets/img/default-avatar-profile-icon-vector.jpg'),
                    backgroundColor: Colors.brown.shade800,
                    // child: const Text('HR'),
                  ),
                  Text(
                    _username ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              )),
          ListTile(
            onTap: () {
              globals.reduxStore.dispatch(NavigateToUrlAction('/home'));
            },
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
          ),
          ListTile(
            onTap: () {
              // globals.store.dispatch(NavigateToUrlAction('/messages'));
            },
            leading: const Icon(Icons.message),
            title: const Text('Messages'),
          ),
          ListTile(
            onTap: () {
              globals.reduxStore.dispatch(NavigateToUrlAction('/profile'));
            },
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
          ),
          ListTile(
            onTap: () {
              // globals.store.dispatch(NavigateToUrlAction('/courses'));
            },
            leading: const Icon(Icons.menu_book_rounded),
            title: const Text('Courses'),
          ),
          ListTile(
            onTap: () {
              // globals.store.dispatch(NavigateToUrlAction('/payment'));
            },
            leading: const Icon(Icons.payment),
            title: const Text('Payment'),
          ),
          ListTile(
            onTap: () {
              globals.reduxStore.dispatch(NavigateToUrlAction('/services'));
            },
            leading: const Icon(Icons.history_edu),
            title: const Text('Request Papers Services'),
          ),
          ListTile(
            onTap: () {
              // globals.store.dispatch(NavigateToUrlAction('/settings'));
            },
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.logout_rounded),
            title: const Text('Logout'),
          ),
          ListTile(
            onTap: () {
              globals.reduxStore.dispatch(NavigateToUrlAction('/admin'));
            },
            leading: const Icon(Icons.edit),
            title: const Text('Add/Remove Classrooms\n(POC)'),
          ),
        ],
      ),
    );
  }
}
