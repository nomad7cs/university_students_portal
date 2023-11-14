import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/custom_appbar.dart';

import 'app_redux/actions.dart';
import 'globals.dart' as globals;

class CustomProfileScreen extends StatelessWidget {
  const CustomProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ProfileScreen(
        actions: [
          SignedOutAction((context) {
            // Navigator.of(context).pop();
            globals.reduxStore.dispatch(UserLoggedOutAction());
            globals.reduxStore.dispatch(// TODO: MAKE an action for popping a url
                NavigateToUrlAction(globals.reduxStore.state.currentUrl[globals.reduxStore.state.currentUrl.length - 2]));
          })
        ],
      ),
    );
  }
}
