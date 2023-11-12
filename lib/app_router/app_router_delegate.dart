import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:univ_port_app/app_redux/app_state.dart';
import 'package:univ_port_app/app_router/route_information.dart';

import '../app_redux/actions.dart';
import '../home_screen.dart';
import '../main.dart';
import '../services_requests.dart';

class AppRouterStateObserver extends ValueNotifier<MyAppState> {
  AppRouterStateObserver(MyAppState initialState) : super(initialState);

  void subscribeToStore(Store<MyAppState> store) {
    // store.dispatch(NavigateToUrlAction('/')); // Set initial route

    final subscription = store.onChange.listen((state) {
      value = state;
      notifyListeners();
    });

    addListener(() {
      if (value.currentUrl != store.state.currentUrl) {
        store.dispatch(NavigateToUrlAction(value.currentUrl));
      }
    });

    // disposables.add(subscription);
  }

  @override
  void dispose() {
    // disposables.clear();
    super.dispose();
  }
}

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  final AppRouterStateObserver urlStateObserver;

  AppRouterDelegate(this.urlStateObserver) {
    urlStateObserver.subscribeToStore(store);
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
  build(BuildContext context) {
    // urlStateObserver = StoreProvider.of<MyAppState>(context).state.currentUrl;
    // var curr = urlStateObserver.
    List<MaterialPage> pagesList = urlStateObserver.value.currentUrlStack.map((e) {
      switch (e) {
        case '/':
          return MaterialPage(key: ValueKey('HomePage'), child: HomeScreen(title: 'Misr University'));
        case '/services':
          return MaterialPage(key: ValueKey('ServicesScreen'), child: ServicesScreen());
      }
      return MaterialPage(key: ValueKey('HomePage'), child: HomeScreen(title: 'Misr University'));
    }).toList();

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
