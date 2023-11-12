import 'dart:async';

import 'package:flutter/material.dart';
import 'package:univ_port_app/app_router/route_information.dart';
import 'package:univ_port_app/login_screen.dart';
import 'package:univ_port_app/request_screen.dart';

import '../../globals.dart' as globals;
import '../home_screen.dart';
import '../services_requests.dart';

// class AppRouterStateObserver extends ValueNotifier<MyAppState> {
//   AppRouterStateObserver(MyAppState initialState) : super(initialState);
//
//   void subscribeToStore(Store<MyAppState> store) {
//     // store.dispatch(NavigateToUrlAction('/')); // Set initial route
//
//     final subscription = store.onChange.listen((state) {
//       value = state;
//       notifyListeners();
//     });
//
//     addListener(() {
//       if (value.currentUrl != store.state.currentUrl) {
//         store.dispatch(NavigateToUrlAction(value.currentUrl));
//       }
//     });
//
//     // disposables.add(subscription);
//   }
//
//   @override
//   void dispose() {
//     // disposables.clear();
//     super.dispose();
//   }
// }

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  // late AppRouterStateObserver urlStateObserver;
  // MyAppState? urlStateObserver2 = globals.store.state;
  final GlobalKey<NavigatorState> navigatorKey;
  String? currentUrl = '/';
  List<String>? currentUrlStack = ['/'];

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    //   urlStateObserver.subscribeToStore(store);
    // globals.store.onChange.listen((event) {
    //   urlStateObserver2 = event;
    // });

    globals.store.onChange.listen((event) {
      if (currentUrl != event.currentUrl) {
        currentUrl = event.currentUrl;
        currentUrlStack = event.currentUrlStack;
        print('listener fired');
        notifyListeners();
      }
    });
  }

  @override
  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // @override
  // void initState() {
  //   super.initState();
  //   _stateSubscription = store.state.listen((state) {
  //     currentRoutePath = state.currentUrl;
  //     notifyListeners();
  //   });
  // }

  @override
  AppRoutePath get currentConfiguration {
    return AppRoutePath(); // TODO: Implement based on appstate listener (URL)
  }

  @override
  Widget build(BuildContext context) {
    List<MaterialPage> pagesList = currentUrlStack!.map((e) {
      switch (e) {
        // case '/':
        //   return MaterialPage(key: ValueKey('HomePage'), child: HomeScreen(title: 'Misr University'));
        case '/':
        case '/login':
          return MaterialPage(key: ValueKey('LoginScreen'), child: LoginScreen());
        case '/home':
          return MaterialPage(
              key: ValueKey('HomeScreen'), child: HomeScreen(title: 'Misr University For Science & Technology'));
        case '/services':
          return MaterialPage(key: ValueKey('ServicesScreen'), child: ServicesScreen());
        case '/request_papaer':
          return MaterialPage(key: ValueKey('RequestPaper'), child: RequestScreen(serviceName: 'بيان حالة'));
      }
      return MaterialPage(key: ValueKey('LoginScreen'), child: LoginScreen());
    }).toList();

    print('pagesList:');
    print(pagesList);
    // print('pagesList2:');
    // print(pagesList2);
    return Navigator(
      key: navigatorKey,
      pages: [
        ...pagesList
        // MaterialPage(
        //   key: ValueKey('HomePage'),
        //   child: HomeScreen(title: 'Misr University'),
        // ),
        // MaterialPage(
        //     key: ValueKey('LoginPage'),
        //     child: LoginScreen()),
        // MaterialPage(
        //     key: ValueKey('ServicesScreen'),
        //     child: ServicesScreen())
        // MaterialPage(child: RequestScreen(serviceName: 'بيان حالة',)),

        // numbers.map((x) => x * x).toList()
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        // TODO: Update appstate
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) {
    // TODO
    throw UnimplementedError();
  }

  // void _handleBookTapped(Book book) {
  //   _selectedBook = book;
  //   notifyListeners();
  // }
}
