import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/admin_screen.dart';
import 'package:univ_port_app/app_redux/actions.dart';
import 'package:univ_port_app/app_router/route_information.dart';
import 'package:univ_port_app/custom_profile_screen.dart';
import 'package:univ_port_app/globals.dart' as globals;
import 'package:univ_port_app/home_screen.dart';
import 'package:univ_port_app/login_screen.dart';
import 'package:univ_port_app/payment_screen.dart';
import 'package:univ_port_app/request_papers/request_screen.dart';

import '../request_papers/services_requests.dart';
import '../splash_screen.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String? currentUrl = globals.reduxStore.state.currentUrl;
  List<String>? currentUrlStack = globals.reduxStore.state.currentUrlStack;
  late StreamSubscription _urlSubscription;

  AppRouterDelegate() {
    if (kDebugMode) {
      print('\x1B[32mRe instantiating the RouterDelegate\x1B[0m');
    }
    _urlSubscription = globals.reduxStore.onChange.listen((event) {
      currentUrl = event.currentUrl;
      currentUrlStack = [...event.currentUrlStack];
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _urlSubscription.cancel();
    super.dispose();
  }

  @override
  AppRoutePath get currentConfiguration {
    if (kDebugMode) {
      print('AppRouterDelegate.currentConfiguration is called');
    }
    final result = AppRoutePath();
    result.currentUrl = currentUrl;
    result.isUnknown = globals.reduxStore.state.unknownUrl;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    List<String> tmpList = [];
    List<MaterialPage> pagesList = currentUrlStack!.map((e) {
      tmpList.add(e);
      switch (e) {
        case '/':
          // if (globals.reduxStore.state.user != null) {
          return const MaterialPage(
            key: ValueKey('splashScreen'),
            child: SplashScreen(),
          );
        // } else {
        //   return const MaterialPage(key: ValueKey('LoginScreen'), child: LoginScreen());
        // }
        case '/login':
          return const MaterialPage(key: ValueKey('LoginScreen'), child: LoginScreen());
        case '/home':
          return const MaterialPage(
              key: ValueKey('HomeScreen'), child: HomeScreen(title: 'Misr University For Science & Technology'));
        case '/services':
          return const MaterialPage(key: ValueKey('ServicesScreen'), child: ServicesScreen());
        case '/request_paper':
          return const MaterialPage(key: ValueKey('RequestPaper'), child: RequestScreen());
        case '/profile':
          return const MaterialPage(key: ValueKey('Profile'), child: CustomProfileScreen());
        case '/admin':
          return const MaterialPage(key: ValueKey('Admin'), child: AdminScreen());
        case '/payment':
          return const MaterialPage(key: ValueKey('PaymentScreen'), child: PaymentScreen());
      }
      return const MaterialPage(key: ValueKey('LoginScreen'), child: LoginScreen());
    })
        // .toList()
        // .reversed
        .toList();

    if (kDebugMode) {
      print('\x1B[35mRouterDelegate  building PAGES....\x1B[0m');
      for (var ee in tmpList) {
        print('\t\tpage $ee');
      }
      print('\x1B[35m pagesList[0].key:  ${pagesList[0].key}\x1B[0m');
    }

    return Navigator(
      key: navigatorKey,
      pages: [...pagesList],
      onPopPage: (route, result) {
        // if (kDebugMode) {
        //   print('AppRouterDelegate .. onPopPage called');
        // }
        if (!route.didPop(result)) {
          return false;
        }

        /*  Needed ?????????
        * // Update the list of pages by setting _selectedBook to null
        * setState(() {
        * _selectedBook = null;
        * });
        *
        * Using setState notifies the framework to call the build() method
        * */

        // Update the list of pages by setting _selectedBook to null
        // globals.reduxStore.dispatch(action)  // todo: update appstate
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    // if (kDebugMode) {
    //   print('AppRouterDelegate.setNewRoutePath is called');
    // }
    if (configuration.currentUrl != null) {
      globals.reduxStore.dispatch(NavigateToUrlAction(configuration.currentUrl!));
    }

    return;
  }
}
