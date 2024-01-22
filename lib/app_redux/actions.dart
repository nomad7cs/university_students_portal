// Create typed actions. You will dispatch these in order to
// update the state of your application.
// Actions should be simple Enums, or classes if the Action contains payload information.
//
// enum Actions {
// goToUrl,
// navBack,
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:univ_port_app/app_redux/app_state.dart';

class NavigateToUrlAction {
  final String url;
  NavigateToUrlAction(this.url);
}

class SetNavigationPayloadAction {
  dynamic payload;
  SetNavigationPayloadAction(this.payload);
}

class UserLoggedInAction {
  User? user;
  UserLoggedInAction(this.user);
}

class SetCurrentServiceNameAction {
  final String name;
  SetCurrentServiceNameAction(this.name);
}

class SetCurrentServiceMinRequiredHoursAction {
  final int minRequiredHours;
  SetCurrentServiceMinRequiredHoursAction(this.minRequiredHours);
}

class UserLoggedOutAction {
  UserLoggedOutAction();
}

class FetchCoursesAction {}

// class FetchCoursesSucceededAction {
//   List<Course> courses;
//   FetchCoursesSucceededAction(this.courses);
// }

class FetchCoursesFailedAction {
  final dynamic error;
  FetchCoursesFailedAction(this.error);
}

class FetchTodayClassesAction {}

class FetchTodayClassesSucceededAction {
  List<ClassroomSlot> todayClasses;
  FetchTodayClassesSucceededAction(this.todayClasses);
}

class FetchTodayClassesFailedAction {
  final dynamic error;
  FetchTodayClassesFailedAction(this.error);
}

class SetUserTypeAction {
  final int choice;
  SetUserTypeAction(this.choice);
}

class SetTypeStudentPayloadAction {
  final bool payload;
  SetTypeStudentPayloadAction(this.payload);
}

class SaveUserDataAction {}

class ExitEditStudentAction {}

class FetchExtraUserInfoAction {
  final String uid;
  FetchExtraUserInfoAction({required this.uid});
}

class SetUserNamePayloadAction {
  final String namePayload;

  SetUserNamePayloadAction(this.namePayload);
}

class FetchExtraUserInfoSucceededAction {
  String? username;
  String? email;
  bool? isStudent;
  int? totalEarnedHours;
  FetchExtraUserInfoSucceededAction({this.username, this.email, this.isStudent, this.totalEarnedHours});
}

class FetchExtraUserInfoFailedAction {
  final dynamic error;
  FetchExtraUserInfoFailedAction(this.error);
}

class ToggleEditingUserAction {
  final bool payload;
  ToggleEditingUserAction(this.payload);
}

class SetEarnedHoursPayloadAction {
  int? payload;
  SetEarnedHoursPayloadAction(this.payload);
}
