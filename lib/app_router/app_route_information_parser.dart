import 'package:flutter/material.dart';

import 'route_information.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {

  @override
  Future<AppRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    // Handle '/'
    if (uri.pathSegments.isEmpty) {
      return AppRoutePath();
    }

    // Handle '/book/:id'
    if (uri.pathSegments.length == 2) {
      if ( !AppRoutePath.paths.contains(uri.pathSegments[0]) ) return AppRoutePath.unknown();
      if (uri.pathSegments[0] == 'student') {
        var id = uri.pathSegments[1];
        return AppRoutePath.student(id);
      }

    }

    // Handle unknown routes
    return AppRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(AppRoutePath configuration) {
    // if (configuration.isUnknown) {
    //   return RouteInformation(uri: Uri.parse('/404'));
    // }
    // TODO: USE app state; listener
    return RouteInformation(uri: Uri.parse(configuration.currentUrl));
  }
}
