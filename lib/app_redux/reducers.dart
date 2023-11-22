// Create a Reducer. A reducer is a pure function that takes the
// current State (int) and the Action that was dispatched. It should
// combine the two into a new state without mutating the state passed
// in! After the state is updated, the store will emit the update to
// the `onChange` stream.
//
// Because reducers are pure functions, they should not perform any
// side-effects, such as making an HTTP request or logging messages
// to a console. For that, use Middleware.
import 'package:univ_port_app/app_redux/app_state.dart';

import 'actions.dart';

MyAppState appReducer(MyAppState state, action) {
  if (action is NavigateToUrlAction) {
    List<String> newUrlStack;
    if (state.currentUrlStack.contains(action.url)) {
      // int duplicateUrlIndex = state.currentUrlStack.indexOf(action.url);
      if (state.currentUrlStack.length == 1) {
        newUrlStack = state.currentUrlStack;
      } else {
        List<String> t = [...state.currentUrlStack];
        t.remove(action.url);
        newUrlStack = [
          ...t,
          action.url,
        ];
      }
    } else {
      newUrlStack = [...state.currentUrlStack, action.url];
    }
    // TODO: Check if it's needed to Remove the url from the stack if it's appended to the new stack
    return MyAppState(
      currentUrl: action.url,
      currentUrlStack: [...newUrlStack],
      user: state.user,
      todayCourses: state.todayCourses,
      studentCourses: state.studentCourses,
      isStudent: state.isStudent,
      isStudentPayload: state.isStudentPayload,
      unknownUrl: state.unknownUrl,
      editingUserType: state.editingUserType,
    );
  } else if (action is UserLoggedInAction) {
    return MyAppState(
      currentUrl: state.currentUrl,
      currentUrlStack: [...state.currentUrlStack],
      user: AppUser(firebaseUser: action.user!),
      todayCourses: state.todayCourses,
      studentCourses: state.studentCourses,
      isStudent: state.isStudent,
      isStudentPayload: state.isStudentPayload,
      unknownUrl: state.unknownUrl,
      editingUserType: state.editingUserType,
    );
  } else if (action is UserLoggedOutAction) {
    return MyAppState(
      currentUrl: state.currentUrl,
      currentUrlStack: [...state.currentUrlStack],
      user: null,
      todayCourses: null,
      studentCourses: null,
      isStudent: state.isStudent,
      isStudentPayload: state.isStudentPayload,
      unknownUrl: state.unknownUrl,
      editingUserType: state.editingUserType,
    );
  } else if (action is FetchCoursesAction) {
    // TODO: Use a 'fetching' state
    return state;
  } else if (action is FetchCoursesSucceededAction) {
    return MyAppState(
      currentUrl: state.currentUrl,
      currentUrlStack: [...state.currentUrlStack],
      user: state.user,
      todayCourses: state.todayCourses,
      studentCourses: action.courses,
      isStudent: state.isStudent,
      isStudentPayload: state.isStudentPayload,
      unknownUrl: state.unknownUrl,
      editingUserType: state.editingUserType,
    );
  } else if (action is FetchCoursesFailedAction) {
    return state;
  } else if (action is FetchTodayClassesAction) {
    // TODO: Use a 'fetching' state
    return state;
  } else if (action is FetchTodayClassesSucceededAction) {
    return MyAppState(
      currentUrl: state.currentUrl,
      currentUrlStack: [...state.currentUrlStack],
      user: state.user,
      todayCourses: action.todayClasses,
      studentCourses: state.studentCourses,
      isStudent: state.isStudent,
      isStudentPayload: state.isStudentPayload,
      unknownUrl: state.unknownUrl,
      editingUserType: state.editingUserType,
    );
  } else if (action is FetchTodayClassesFailedAction) {
    return state;
  } else if (action is ToggleEditingUserTypeAction) {
    return MyAppState(
      currentUrl: state.currentUrl,
      currentUrlStack: [...state.currentUrlStack],
      user: state.user,
      todayCourses: state.todayCourses,
      studentCourses: state.studentCourses,
      isStudent: state.isStudent,
      isStudentPayload: state.isStudentPayload,
      unknownUrl: state.unknownUrl,
      editingUserType: !state.editingUserType!,
    );
  } else if (action is SetTypeStudentPayloadAction) {
    return MyAppState(
      currentUrl: state.currentUrl,
      currentUrlStack: [...state.currentUrlStack],
      user: state.user,
      todayCourses: state.todayCourses,
      studentCourses: state.studentCourses,
      isStudent: state.isStudent,
      isStudentPayload: action.payload,
      unknownUrl: state.unknownUrl,
      editingUserType: state.editingUserType,
    );
  } else if (action is FetchExtraUserInfoAction) {
    return state;
  } else if (action is FetchExtraUserInfoSucceededAction) {
    return MyAppState(
      currentUrl: state.currentUrl,
      currentUrlStack: [...state.currentUrlStack],
      user: state.user,
      todayCourses: state.todayCourses,
      studentCourses: state.studentCourses,
      isStudent: action.isStudent,
      isStudentPayload: state.isStudentPayload,
      unknownUrl: state.unknownUrl,
      editingUserType: state.editingUserType,
    );
  } else if (action is SaveIsStudentAction) {
    return state;
  }
  return state;
}
