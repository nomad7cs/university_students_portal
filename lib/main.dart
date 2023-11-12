import 'package:flutter/material.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:redux/redux.dart';
import 'package:univ_port_app/app_redux/app_state.dart';

import 'app_redux/reducers.dart';
import 'app_router/app_route_information_parser.dart';
import 'app_router/app_router_delegate.dart';

// Create the store with our Reducer and Middleware
final store = Store<MyAppState>(
  appReducer,
  initialState: new MyAppState(currentUrl: '/', currentUrlStack: ['/']),
  // middleware: [loggingMiddleware],
);

void main() {
  // usePathUrlStrategy();

  runApp(AppShell());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Misr University'),
//     );
//   }
// }

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  // final AppRouterStateObserver stateObserver = AppRouterStateObserver(
  //   MyAppState(currentUrl: '', currentUrlStack: ['']),
  // );
  final AppRouterStateObserver stateObserver = AppRouterStateObserver(store.state);

  late final AppRouterDelegate _routerDelegate = AppRouterDelegate(stateObserver);
  final AppRouteInformationParser _routeInformationParser = AppRouteInformationParser();

  // @override
  // void initState(){
  //   super.initState();
  //   this._routerDelegate = AppRouterDelegate(stateObserver);
  //
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        //   colorScheme: const ColorScheme.dark().copyWith(
        //     primary: Colors.green[700],
        //     secondary: Colors.green[700],
        //   ),
        // inputDecorationTheme: InputDecorationTheme(
        //   filled: true,
        //   fillColor: Theme.of(context).colorScheme.onPrimary,
        //   hintStyle: TextStyle(
        //     color: Colors.green[700],
        //   ),
        // ),
        // floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //   foregroundColor: Colors.white,
        // ),
        ///////////
        colorSchemeSeed: Colors.blueGrey[700],
        /////////////
        /////////////
      ),
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
