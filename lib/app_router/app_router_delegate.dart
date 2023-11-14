import 'dart:async';

import 'package:flutter/material.dart';
import 'package:univ_port_app/app_router/route_information.dart';
import 'package:univ_port_app/custom_profile_screen.dart';
import 'package:univ_port_app/login_screen.dart';
import 'package:univ_port_app/request_screen.dart';

import '../../globals.dart' as globals;
import '../home_screen.dart';
import '../services_requests.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  String? currentUrl = '/';
  List<String>? currentUrlStack = ['/'];

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    globals.reduxStore.onChange.listen((event) {
      if (currentUrl != event.currentUrl) {
        currentUrl = event.currentUrl;
        currentUrlStack = event.currentUrlStack;
        notifyListeners();
      }
    });
  }

  @override
  AppRoutePath get currentConfiguration {
    return AppRoutePath(); // TODO: Implement based on appState listener (URL)
  }

  @override
  Widget build(BuildContext context) {
    List<MaterialPage> pagesList = currentUrlStack!
        .map((e) {
          switch (e) {
            case '/':
              if (globals.reduxStore.state.user != null) {
                return const MaterialPage(
                    key: ValueKey('HomeScreen'), child: HomeScreen(title: 'Misr University For Science & Technology'));
              } else {
                return const MaterialPage(key: ValueKey('LoginScreen'), child: LoginScreen());
              }
            case '/login':
              if (globals.reduxStore.state.user == null) {
                return const MaterialPage(key: ValueKey('LoginScreen'), child: LoginScreen());
              }
            case '/home':
              return const MaterialPage(
                  key: ValueKey('HomeScreen'), child: HomeScreen(title: 'Misr University For Science & Technology'));
            case '/services':
              return const MaterialPage(key: ValueKey('ServicesScreen'), child: ServicesScreen());
            case '/request_paper':
              return const MaterialPage(key: ValueKey('RequestPaper'), child: RequestScreen(serviceName: 'بيان حالة'));
            case '/profile':
              return const MaterialPage(key: ValueKey('Profile'), child: CustomProfileScreen());
          }
          return const MaterialPage(key: ValueKey('LoginScreen'), child: LoginScreen());
        })
        // .toList()
        .toSet()
        .toList();

    return Navigator(
      key: navigatorKey,
      pages: [...pagesList],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        /*  Needed ??
        * // Update the list of pages by setting _selectedBook to null
        * setState(() {
        * _selectedBook = null;
        * });
        *
        * Using setState notifies the framework to call the build() method
        * */

        // Update the list of pages by setting _selectedBook to null
        // TODO: Update appState
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
}
