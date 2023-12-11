// Create a Reducer. A reducer is a pure function that takes the
// current State (int) and the Action that was dispatched. It should
// combine the two into a new state without mutating the state passed
// in! After the state is updated, the store will emit the update to
// the `onChange` stream.
//
// Because reducers are pure functions, they should not perform any
// side-effects, such as making an HTTP request or logging messages
// to a console. For that, use Middleware.
import 'package:flutter/foundation.dart';
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
    if (kDebugMode) {
      print('\x1B[32mNavigateToUrlAction\x1B[0m');
    }
    return MyAppState(
        currentUrl: action.url,
        currentUrlStack: [...newUrlStack],
        user: state.user,
        todayCourses: state.todayCourses,
        studentCourses: state.studentCourses,
        isStudent: state.isStudent,
        isStudentPayload: state.isStudentPayload,
        unknownUrl: state.unknownUrl,
        editingUser: state.editingUser,
        totalEarnedHours: state.totalEarnedHours,
        username: state.username,
        namePayload: state.namePayload,
        stateCounter: state.stateCounter + 1);
  } else if (action is UserLoggedInAction) {
    if (kDebugMode) {
      print('\x1B[32mUserLoggedInAction\x1B[0m');
    }
    return MyAppState(
        currentUrl: state.currentUrl,
        currentUrlStack: [...state.currentUrlStack],
        user: AppUser(firebaseUser: action.user!),
        todayCourses: state.todayCourses,
        studentCourses: state.studentCourses,
        isStudent: state.isStudent,
        isStudentPayload: state.isStudentPayload,
        unknownUrl: state.unknownUrl,
        editingUser: state.editingUser,
        totalEarnedHours: state.totalEarnedHours,
        username: state.username,
        namePayload: state.namePayload,
        stateCounter: state.stateCounter + 1);
  } else if (action is UserLoggedOutAction) {
    if (kDebugMode) {
      print('\x1B[32mUserLoggedOutAction\x1B[0m');
    }
    return MyAppState(
        currentUrl: state.currentUrl,
        currentUrlStack: [...state.currentUrlStack],
        user: null,
        todayCourses: null,
        studentCourses: null,
        isStudent: null,
        isStudentPayload: null,
        unknownUrl: state.unknownUrl,
        editingUser: false,
        username: null,
        totalEarnedHours: null,
        stateCounter: state.stateCounter + 1);
  } else if (action is FetchCoursesAction) {
    if (kDebugMode) {
      print('\x1B[32mFetchCoursesAction\x1B[0m');
      print('\x1B[32mSAME State!!!!!!!!!\x1B[0m');
    }
    // TODO: Use a 'fetching' state
    return state;
  } else if (action is FetchCoursesSucceededAction) {
    if (kDebugMode) {
      print('\x1B[32mFetchCoursesSucceededAction\x1B[0m');
    }
    return MyAppState(
        currentUrl: state.currentUrl,
        currentUrlStack: [...state.currentUrlStack],
        user: state.user,
        todayCourses: state.todayCourses,
        studentCourses: action.courses,
        isStudent: state.isStudent,
        isStudentPayload: state.isStudentPayload,
        unknownUrl: state.unknownUrl,
        editingUser: state.editingUser,
        totalEarnedHours: state.totalEarnedHours,
        username: state.username,
        namePayload: state.namePayload,
        stateCounter: state.stateCounter + 1);
  } else if (action is FetchCoursesFailedAction) {
    if (kDebugMode) {
      print('\x1B[32mFetchCoursesFailedAction\x1B[0m');
      print('\x1B[32mSAME State!!!!!!!!!\x1B[0m');
    }
    return state;
  } else if (action is FetchTodayClassesAction) {
    if (kDebugMode) {
      print('\x1B[32mFetchTodayClassesAction\x1B[0m');
      print('\x1B[32mSAME State!!!!!!!!!\x1B[0m');
    }
    // TODO: Use a 'fetching' state
    return state;
  } else if (action is FetchTodayClassesSucceededAction) {
    if (kDebugMode) {
      print('\x1B[32mFetchTodayClassesSucceededAction\x1B[0m');
    }
    return MyAppState(
        currentUrl: state.currentUrl,
        currentUrlStack: [...state.currentUrlStack],
        user: state.user,
        todayCourses: action.todayClasses,
        studentCourses: state.studentCourses,
        isStudent: state.isStudent,
        isStudentPayload: state.isStudentPayload,
        unknownUrl: state.unknownUrl,
        editingUser: state.editingUser,
        totalEarnedHours: state.totalEarnedHours,
        username: state.username,
        namePayload: state.namePayload,
        stateCounter: state.stateCounter + 1);
  } else if (action is FetchTodayClassesFailedAction) {
    if (kDebugMode) {
      print('\x1B[32mFetchTodayClassesFailedAction\x1B[0m');
      print('\x1B[32mSAME State!!!!!!!!!\x1B[0m');
    }
    return state;
  } else if (action is ToggleEditingUserAction) {
    if (kDebugMode) {
      print('\x1B[32mToggleEditingUserAction\x1B[0m');
    }
    return MyAppState(
        currentUrl: state.currentUrl,
        currentUrlStack: [...state.currentUrlStack],
        user: state.user,
        todayCourses: state.todayCourses,
        studentCourses: state.studentCourses,
        isStudent: state.isStudent,
        isStudentPayload: state.isStudentPayload,
        unknownUrl: state.unknownUrl,
        editingUser: action.payload,
        totalEarnedHours: state.totalEarnedHours,
        namePayload: state.namePayload,
        username: state.username,
        stateCounter: state.stateCounter + 1);
  } else if (action is SetTypeStudentPayloadAction) {
    if (kDebugMode) {
      print('\x1B[32mSetTypeStudentPayloadAction\x1B[0m');
    }
    return MyAppState(
      currentUrl: state.currentUrl,
      currentUrlStack: [...state.currentUrlStack],
      user: state.user,
      todayCourses: state.todayCourses,
      studentCourses: state.studentCourses,
      isStudent: state.isStudent,
      isStudentPayload: action.payload,
      unknownUrl: state.unknownUrl,
      editingUser: state.editingUser,
      totalEarnedHours: state.totalEarnedHours,
      username: state.username,
      namePayload: state.namePayload,
      stateCounter: state.stateCounter + 1,
    );
  } else if (action is FetchExtraUserInfoAction) {
    if (kDebugMode) {
      print('\x1B[32mFetchExtraUserInfoAction\x1B[0m');
      print('\x1B[32mSAME State!!!!!!!!!\x1B[0m');
    }
    return state;
  } else if (action is FetchExtraUserInfoSucceededAction) {
    if (kDebugMode) {
      print('\x1B[32mFetchExtraUserInfoSucceededAction ${action.username}\x1B[0m');
    }
    return MyAppState(
        currentUrl: state.currentUrl,
        currentUrlStack: [...state.currentUrlStack],
        user: state.user,
        todayCourses: state.todayCourses,
        studentCourses: state.studentCourses,
        isStudent: action.isStudent,
        isStudentPayload: state.isStudentPayload,
        unknownUrl: state.unknownUrl,
        editingUser: state.editingUser,
        totalEarnedHours: action.totalEarnedHours,
        earnedHoursPayload: state.earnedHoursPayload,
        namePayload: state.namePayload,
        username: action.username,
        stateCounter: state.stateCounter + 1);
  } else if (action is SaveUserDataAction) {
    if (kDebugMode) {
      print('\x1B[32mSaveIsStudentAction\x1B[0m');
      print('\x1B[32mSAME State!!!!!!!!!\x1B[0m');
    }
    return state;
  } else if (action is SetEarnedHoursPayloadAction) {
    return MyAppState(
      currentUrl: state.currentUrl,
      currentUrlStack: [...state.currentUrlStack],
      user: state.user,
      todayCourses: state.todayCourses,
      studentCourses: state.studentCourses,
      isStudent: state.isStudent,
      isStudentPayload: state.isStudentPayload,
      unknownUrl: state.unknownUrl,
      editingUser: state.editingUser,
      username: state.username,
      totalEarnedHours: state.totalEarnedHours,
      earnedHoursPayload: action.payload,
      namePayload: state.namePayload,
      stateCounter: state.stateCounter + 1,
    );
  } else if (action is SetUserNamePayloadAction) {
    return MyAppState(
      currentUrl: state.currentUrl,
      currentUrlStack: [...state.currentUrlStack],
      user: state.user,
      todayCourses: state.todayCourses,
      studentCourses: state.studentCourses,
      isStudent: state.isStudent,
      isStudentPayload: state.isStudentPayload,
      unknownUrl: state.unknownUrl,
      username: state.username,
      editingUser: state.editingUser,
      totalEarnedHours: state.totalEarnedHours,
      earnedHoursPayload: state.earnedHoursPayload,
      namePayload: action.namePayload,
      stateCounter: state.stateCounter + 1,
    );
  }

  if (kDebugMode) {
    print('\x1B[32mNoooooooooooooooooooooooooooo Actionnnnnnnnnnnnnnnnnn selected\x1B[0m');
    print('\x1B[32mSAME State!!!!!!!!!\x1B[0m');
  }
  return state;
}
