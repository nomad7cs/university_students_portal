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

class UserLoggedInAction {
  User? user;
  UserLoggedInAction(this.user);
}

class UserLoggedOutAction {
  UserLoggedOutAction();
}

class FetchCoursesAction {}

class FetchCoursesSucceededAction {
  List<Course> courses;
  FetchCoursesSucceededAction(this.courses);
}

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
  int choice;
  SetUserTypeAction(this.choice);
}

class SetTypeStudentPayloadAction {
  final bool payload;
  SetTypeStudentPayloadAction(this.payload);
}

class SaveIsStudentAction {}

class ExitEditStudentTypeAction {}

class FetchExtraUserInfoAction {
  final String uid;
  FetchExtraUserInfoAction({required this.uid});
}

class FetchExtraUserInfoSucceededAction {
  bool isStudent;
  FetchExtraUserInfoSucceededAction(this.isStudent);
}

class FetchExtraUserInfoFailedAction {
  final dynamic error;
  FetchExtraUserInfoFailedAction(this.error);
}

class ToggleEditingUserTypeAction {}
