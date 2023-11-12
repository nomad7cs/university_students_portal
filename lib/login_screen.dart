import 'package:flutter/material.dart';
import 'package:univ_port_app/custom_appbar.dart';

import 'app_drawer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        drawer: AppDrawer(),
        body: SafeArea(
          top: true,
          child: Container(
            // color: Colors.blueGrey[900],
            alignment: Alignment.center, // Adding Alignment -> expands Container
            // height: double.infinity,
            // width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: _formKey,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'Student Portal',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 40, color: Colors.lightBlue),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              'Welcome\nPlease, Log in to your account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                              ), // color: Colors.white),
                            )),
                            Expanded(
                                child: Container(
                              padding: const EdgeInsets.fromLTRB(5.0, 12.0, 5.0, 12.0),
                              // color: Colors.deepOrangeAccent,
                              child: TextFormField(
                                // initialValue: 'Please enter your ID',
                                decoration: const InputDecoration(
                                  labelText: 'Your ID',
                                  // errorText: 'Please enter your ID',
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  suffixIcon: Icon(
                                    Icons.error,
                                  ),
                                ),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your ID';
                                  }
                                  return null;
                                },
                              ),
                            )),
                            // Divider(),
                            Expanded(
                                child: Container(
                              padding: const EdgeInsets.fromLTRB(5.0, 12.0, 5.0, 12.0),
                              // color: Colors.amber,
                              alignment: Alignment.center,
                              child: TextFormField(
                                // initialValue: 'Please enter your ID',
                                decoration: const InputDecoration(
                                  labelText: 'Your Password',
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  // fillColor: Colors.white,
                                  suffixIcon: Icon(
                                    Icons.error,
                                  ),
                                ),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password or ID is incorrect';
                                  }
                                  return null;
                                },
                              ),
                            )),
                            FilledButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Processing Data')),
                                  );
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          // mainAxisSize: MainAxisSize.max,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Expanded(child: Text('hhhhhhhhhh'),),
                            // Container(
                            //   // width: double.infinity,
                            //   // height: double.infinity,
                            //   color: Colors.black,
                            //   // alignment: Alignment.center,
                            //   // width: 50.0,
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
