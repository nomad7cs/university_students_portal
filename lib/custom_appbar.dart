import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:univ_port_app/app_redux/actions.dart';
import 'package:univ_port_app/app_redux/app_state.dart';
import 'package:univ_port_app/globals.dart' as globals;

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  Future<void> _signOut() async {
    globals.reduxStore.dispatch(UserLoggedOutAction());
    globals.reduxStore.dispatch(NavigateToUrlAction('/login'));
    //Provider.of<MyProvider>(context).reset();
    try {
      await FirebaseAuth.instance.signOut();
      // If using Google sign-in, also sign out from Google:
      await GoogleSignIn().signOut();
      // Optionally, navigate to a different screen or display a success message
    } catch (error) {
      // Handle errors gracefully
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: AppBar(
        // leading: ,
        toolbarHeight: 100.0,
        backgroundColor: const Color.fromARGB(255, 25, 47, 89),
        foregroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(
              width: 58.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.0),
                child: const Image(
                  // image: AssetImage('assets/img/must-logo.png'),
                  image: AssetImage('assets/img/must-logo.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text('Misr University for Science & Technology'),
            // const Text('blaa blablabla blablablablablabla'),
          ],
        ),
        elevation: 4,
        actions: <Widget>[
          const IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.white), // Icons.notification_important
            tooltip: 'Notifications',
            onPressed: null,
          ),
          Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: StreamBuilder<AppUser?>(
                stream: globals.reduxStore.onChange.map((event) => event.user),
                builder: (BuildContext context, AsyncSnapshot<AppUser?> snapshot) {
                  if (snapshot.data != null) {
                    return IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () {
                        _signOut();
                        setState(() {
                          // _key.currentState!.rebuildApp();
                          // _AppShellState();
                          // context.findAncestorStateOfType<_AppShellState>()!.rebuildApp();
                          // AppShell.rebuildApp();
                        });
                      }, // TODO: Implement a dropdown or navigate to profile
                    );
                  }
                  return IconButton(
                    icon: const Icon(Icons.login),
                    onPressed: () {
                      globals.reduxStore.dispatch(NavigateToUrlAction('/login'));
                    },
                  );
                },
              )),
        ],
      ),
    );
  }
}
