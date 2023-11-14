// Create typed actions. You will dispatch these in order to
// update the state of your application.
// Actions should be simple Enums, or classes if the Action contains payload information.
//
// enum Actions {
// goToUrl,
// navBack,
// }

import 'package:firebase_auth/firebase_auth.dart';

class NavigateToUrlAction {
  final String url;

  NavigateToUrlAction(this.url);
}

class UserLoggedInAction {
  User? user;
  UserLoggedInAction(this.user);
}

class UserLoggedOutAction {
  UserLoggedOutAction();
}

// class GoToUrlSucceededAction {
//   // final String url;
//   //
//   // GoToUrlSucceededAction(this.url);
// }
//
// class GoToUrlFailedAction {
//   final Exception error;
//
//   GoToUrlFailedAction(this.error) {
//   }
// }
