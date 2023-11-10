import 'package:flutter/material.dart';

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
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                // Container(
                //   width: 60,
                //   height: 60,
                //   child: Text('sssss'),
                //   decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Color(0xFFe0f2f1)),
                // ),

                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/img/default-avatar-profile-icon-vector.jpg'),
                  backgroundColor: Colors.brown.shade800,
                  // child: const Text('HR'),
                ),
                Text(
                  'Hossam Ramzy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            )
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.menu_book_rounded),
            title: Text('Courses'),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.payment),
            title: Text('Payment'),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.history_edu),
            title: Text('Request Papers Services'),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.logout_rounded),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
