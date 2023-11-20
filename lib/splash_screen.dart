import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/app_redux/actions.dart';

import 'globals.dart' as globals;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Perform the action after 1.2 seconds
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (kDebugMode) {
        print('SplashScreen delayed navigation!!!!');
      }
      // Update state or perform action here
      globals.reduxStore.dispatch(NavigateToUrlAction('/home'));
      // globals.reduxStore.dispatch(NavigateToUrlAction('/login'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 200.0,
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/img/must-logo.png'),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Welcome!, to Misr University for Science & Technology'),
            ],
          ),
        ));
  }
}
