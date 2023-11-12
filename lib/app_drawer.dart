import 'package:flutter/material.dart';

import 'app_redux/actions.dart';
import 'globals.dart' as globals;

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
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
                  const Text(
                    'Hossam Ramzy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              )),
          ListTile(
            onTap: () {
              globals.store.dispatch(NavigateToUrlAction('/home'));
            },
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
          ),
          ListTile(
            onTap: () {
              // globals.store.dispatch(NavigateToUrlAction('/messages'));
            },
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            onTap: () {
              // globals.store.dispatch(NavigateToUrlAction('/profile'));
            },
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            onTap: () {
              // globals.store.dispatch(NavigateToUrlAction('/courses'));
            },
            leading: Icon(Icons.menu_book_rounded),
            title: Text('Courses'),
          ),
          ListTile(
            onTap: () {
              // globals.store.dispatch(NavigateToUrlAction('/payment'));
            },
            leading: Icon(Icons.payment),
            title: Text('Payment'),
          ),
          ListTile(
            onTap: () {
              globals.store.dispatch(NavigateToUrlAction('/services'));
            },
            leading: Icon(Icons.history_edu),
            title: Text('Request Papers Services'),
          ),
          ListTile(
            onTap: () {
              // globals.store.dispatch(NavigateToUrlAction('/settings'));
            },
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.logout_rounded),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
