import 'package:flutter/material.dart';
import 'package:univ_port_app/app_router/route_information.dart';
import 'package:univ_port_app/login_screen.dart';
import 'package:univ_port_app/request_screen.dart';

import '../home_screen.dart';
import '../services_requests.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  AppRoutePath get currentConfiguration {
    return AppRoutePath();  // TODO: Implement based on appstate listener (URL)
  }

  @override
  build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
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
        MaterialPage(child: RequestScreen(serviceName: 'بيان حالة',)),
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
