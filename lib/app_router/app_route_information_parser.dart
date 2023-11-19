import 'package:flutter/material.dart';

import 'route_information.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    final result = AppRoutePath();
    result.currentUrl = uri.path;
    result.isUnknown = true;

    // Handle '/'
    if (uri.pathSegments.isEmpty) {
      result.isUnknown = false;
      result.id = null;
      return result;
    }

    // Handle '/services/:id'
    if (uri.pathSegments.length == 2) {
      switch (uri.pathSegments[0]) {
        case 'services':
          result.isUnknown = false;
          result.id = uri.pathSegments[1];
          return result;
      }
    }
    return result;
  }

  @override
  RouteInformation restoreRouteInformation(AppRoutePath configuration) {
    /*
    if (configuration.isUnknown) {
      return RouteInformation(uri: Uri.parse('/404'));
    }
    if (configuration.isHomePage) {
      return RouteInformation(uri: Uri.parse('/'));
    }
    if (configuration.isDetailsPage) {
      return RouteInformation(uri: Uri.parse('/book/${configuration.id}'));
    }
    return null;
    * */

    // TODO: USE app state; listener      ?????????
    return RouteInformation(uri: Uri.parse(configuration.currentUrl ?? '/'));
  }
}
