import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';

import './app_redux/actions.dart';
import 'app_router/app_route_information_parser.dart';
import 'app_router/app_router_delegate.dart';
import 'firebase_options.dart';
import 'globals.dart' as globals;

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseUIAuth.configureProviders(
      [GoogleProvider(clientId: '16819903455-v6tobhje14li36q175dqc9n7blkql5qt.apps.googleusercontent.com')]);

  FirebaseAuth.instance.userChanges().listen((user) {
    if (user != null) {
      globals.reduxStore.dispatch(UserLoggedInAction(user));
    } else {
      globals.reduxStore.dispatch(UserLoggedOutAction());
    }
  });
}

Future<void> main() async {
  // usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  runApp(const AppShell());
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<StatefulWidget> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late final AppRouterDelegate _routerDelegate = AppRouterDelegate();
  final AppRouteInformationParser _routeInformationParser = AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        colorSchemeSeed: Colors.blueGrey[700],
      ),
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
