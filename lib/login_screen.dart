import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/home_screen.dart';

import 'app_redux/actions.dart';
import 'app_redux/app_state.dart';
import 'globals.dart' as globals;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MyAppState?>(
        stream: globals.reduxStore.onChange,
        // stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData && (snapshot.data?.user == null)) {
            return SignInScreen(
              providers: [
                EmailAuthProvider(),
                // GoogleProvider(clientId: '632995148417-p9mgtp7osfcu5do8ijek8mva42moshu1.apps.googleusercontent.com'),
                GoogleProvider(clientId: '16819903455-v6tobhje14li36q175dqc9n7blkql5qt.apps.googleusercontent.com')
              ],
              actions: [
                AuthStateChangeAction<SignedIn>((context, state) {
                  globals.reduxStore.dispatch(UserLoggedInAction(state.user));
                  globals.reduxStore.dispatch(NavigateToUrlAction('/home'));
                  // Navigator.pushReplacementNamed(context, '/profile');
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
                  ),
                );
              },
            );
          }
          return const HomeScreen(title: 'Misr University For Science & Technology');
        });
    // return Scaffold(
    //     appBar: CustomAppBar(),
    //     drawer: AppDrawer(),
    //     body: SafeArea(
    //       top: true,
    //       child: Container(
    //         // color: Colors.blueGrey[900],
    //         alignment: Alignment.center, // Adding Alignment -> expands Container
    //         // height: double.infinity,
    //         // width: double.infinity,
    //         child: SingleChildScrollView(
    //           scrollDirection: Axis.vertical,
    //           child: Form(
    //             key: _formKey,
    //             child: IntrinsicHeight(
    //               child: Row(
    //                 mainAxisSize: MainAxisSize.max,
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 crossAxisAlignment: CrossAxisAlignment.stretch,
    //                 children: [
    //                   Expanded(
    //                     flex: 1,
    //                     child: Column(
    //                       children: [],
    //                     ),
    //                   ),
    //                   Expanded(
    //                     flex: 4,
    //                     child: Column(
    //                       children: <Widget>[
    //                         Expanded(
    //                           child: Text(
    //                             'Student Portal',
    //                             textAlign: TextAlign.center,
    //                             style: TextStyle(fontSize: 40, color: Colors.lightBlue),
    //                           ),
    //                         ),
    //                         Expanded(
    //                             child: Text(
    //                           'Welcome\nPlease, Log in to your account',
    //                           textAlign: TextAlign.center,
    //                           style: TextStyle(
    //                             fontSize: 17,
    //                           ), // color: Colors.white),
    //                         )),
    //                         Expanded(
    //                             child: Container(
    //                           padding: const EdgeInsets.fromLTRB(5.0, 12.0, 5.0, 12.0),
    //                           // color: Colors.deepOrangeAccent,
    //                           child: TextFormField(
    //                             // initialValue: 'Please enter your ID',
    //                             decoration: const InputDecoration(
    //                               labelText: 'Your ID',
    //                               // errorText: 'Please enter your ID',
    //                               filled: true,
    //                               border: OutlineInputBorder(),
    //                               suffixIcon: Icon(
    //                                 Icons.error,
    //                               ),
    //                             ),
    //                             // The validator receives the text that the user has entered.
    //                             validator: (value) {
    //                               if (value == null || value.isEmpty) {
    //                                 return 'Please enter your ID';
    //                               }
    //                               return null;
    //                             },
    //                           ),
    //                         )),
    //                         // Divider(),
    //                         Expanded(
    //                             child: Container(
    //                           padding: const EdgeInsets.fromLTRB(5.0, 12.0, 5.0, 12.0),
    //                           // color: Colors.amber,
    //                           alignment: Alignment.center,
    //                           child: TextFormField(
    //                             // initialValue: 'Please enter your ID',
    //                             decoration: const InputDecoration(
    //                               labelText: 'Your Password',
    //                               border: OutlineInputBorder(),
    //                               filled: true,
    //                               // fillColor: Colors.white,
    //                               suffixIcon: Icon(
    //                                 Icons.error,
    //                               ),
    //                             ),
    //                             // The validator receives the text that the user has entered.
    //                             validator: (value) {
    //                               if (value == null || value.isEmpty) {
    //                                 return 'Password or ID is incorrect';
    //                               }
    //                               return null;
    //                             },
    //                           ),
    //                         )),
    //                         FilledButton(
    //                           onPressed: () {
    //                             // Validate returns true if the form is valid, or false otherwise.
    //                             if (_formKey.currentState!.validate()) {
    //                               // If the form is valid, display a snackbar. In the real world,
    //                               // you'd often call a server or save the information in a database.
    //                               // ScaffoldMessenger.of(context).showSnackBar(
    //                               //   const SnackBar(content: Text('Processing Data')),
    //                               // );
    //                               // Navigate to HomeScreen
    //                               globals.reduxStore.dispatch(NavigateToUrlAction('/home'));
    //                             }
    //                           },
    //                           child: const Text('Submit'),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Expanded(
    //                     flex: 1,
    //                     child: Column(
    //                       // mainAxisSize: MainAxisSize.max,
    //                       // crossAxisAlignment: CrossAxisAlignment.center,
    //                       children: [
    //                         // Expanded(child: Text('hhhhhhhhhh'),),
    //                         // Container(
    //                         //   // width: double.infinity,
    //                         //   // height: double.infinity,
    //                         //   color: Colors.black,
    //                         //   // alignment: Alignment.center,
    //                         //   // width: 50.0,
    //                         // )
    //                       ],
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ));
  }
}
