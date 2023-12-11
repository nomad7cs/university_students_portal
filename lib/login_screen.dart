import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/globals.dart' as globals;

import 'app_redux/actions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providers: [
        EmailAuthProvider(),
        // GoogleProvider(clientId: '632995148417-p9mgtp7osfcu5do8ijek8mva42moshu1.apps.googleusercontent.com'),
        GoogleProvider(clientId: '16819903455-v6tobhje14li36q175dqc9n7blkql5qt.apps.googleusercontent.com')
      ],
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          globals.reduxStore.dispatch(UserLoggedInAction(state.user));
          globals.reduxStore.dispatch(FetchExtraUserInfoAction(uid: state.user!.uid));
          globals.reduxStore.dispatch(NavigateToUrlAction('/home'));
          // Navigator.pushReplacementNamed(context, '/profile');
        }),
        AuthStateChangeAction<UserCreated>((context, state) {
          FirebaseFirestore.instance.collection('users').doc().set({
            'uid': state.credential.user!.uid,
            'email': state.credential.user!.email,
            'displayName': state.credential.user!.displayName ?? '',
            'isStudent': true,
            'totalEarnedHours': 0,
          }).then(
            (value) {
              globals.reduxStore.dispatch(NavigateToUrlAction('/home'));
            },
          );
        }),
      ],
      headerBuilder: (context, constraints, shrinkOffset) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset('assets/img/must-logo.png'),
          ),
        );
      },
      subtitleBuilder: (context, action) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: action == AuthAction.signIn
              ? const Text('Welcome to Misr University For Science & Technology,\n lease sign in!')
              : const Text('Welcome to Misr University For Science & Technology,\n please sign up!'),
        );
      },
      footerBuilder: (context, action) {
        return const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            'By signing in, you agree to our terms and conditions.',
            style: TextStyle(color: Colors.grey),
          ),
        );
      },
      sideBuilder: (context, shrinkOffset) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset('assets/img/must-logo.png'),
            // child: Image.asset('assets/img/must-logo.png'),
          ),
        );
      },
    );
  }
}
