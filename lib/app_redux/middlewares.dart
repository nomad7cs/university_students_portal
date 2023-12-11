import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:univ_port_app/app_redux/app_state.dart';
import 'package:univ_port_app/globals.dart' as globals;

import 'actions.dart';

void fetchTodosMiddleware(Store<MyAppState> store, action, NextDispatcher next) {
  if (action is FetchTodayClassesAction) {
    /*
    TODO: rebuild
    if (!_loggedIn) {
      throw Exception('Must be logged in');
    }
    * */

    FirebaseFirestore.instance.collection('classroomSlots').orderBy('dateTime', descending: false).get().then((event) {
      final List<ClassroomSlot> classes = [];
      if (event.docs.isNotEmpty) {
        for (var doc in event.docs) {
          // print("${doc.id} => ${doc.data()}");
          classes.add(ClassroomSlot(
              // id: doc.id,
              teacher: doc.data()['teacher'],
              location: doc.data()['location'],
              course: Course(
                code: doc.data()['course']['code'],
                fullName: doc.data()['course']['fullName'],
                img: doc.data()['course']['img'],
              ),
              dateTime: doc.data()['dateTime'].toDate(),
              duration: doc.data()['duration'],
              participants: doc.data()['participants'],
              credit: doc.data()['credit']
              // .toDate(),
              ));
        }
        store.dispatch(FetchTodayClassesSucceededAction(classes));
      }
    }).catchError((error) {
      store.dispatch(FetchTodayClassesFailedAction(error));
    });
  } else if (action is SaveUserDataAction) {
    /*
    TODO: rebuild
    if (!_loggedIn) {
      throw Exception('Must be logged in');
    }
    * */

    FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: globals.reduxStore.state.user?.firebaseUser.uid)
        .get()
        .then((documentSnapshot) {
      if (documentSnapshot.docs.isNotEmpty) {
        String? displayName;
        if (globals.reduxStore.state.namePayload != null) {
          displayName = globals.reduxStore.state.namePayload;
        } else if (globals.reduxStore.state.username != null) {
          displayName = globals.reduxStore.state.username;
        } else if (globals.reduxStore.state.user!.firebaseUser.displayName != null) {
          displayName = globals.reduxStore.state.user!.firebaseUser.displayName;
        } else {
          displayName = '';
        }
        bool? isSt;
        if (globals.reduxStore.state.isStudentPayload != null) {
          isSt = globals.reduxStore.state.isStudentPayload;
        } else if (globals.reduxStore.state.isStudent != null) {
          globals.reduxStore.state.isStudent;
        }
        documentSnapshot.docs[0].reference.update({
          'displayName': displayName,
          'isStudent': isSt ?? true,
          'totalEarnedHours': globals.reduxStore.state.earnedHoursPayload ?? globals.reduxStore.state.totalEarnedHours,
        }).then((value) {
          if (kDebugMode) {
            print('\x1B[33mUser\'s data are created successfully\x1B[0m');
          }
          globals.reduxStore.dispatch(ToggleEditingUserAction(false));
          globals.reduxStore.dispatch(FetchExtraUserInfoAction(uid: globals.reduxStore.state.user!.firebaseUser.uid));
        });
      } //else {
      //   FirebaseFirestore.instance.collection('users').doc().set({
      //     'uid': globals.reduxStore.state.user?.firebaseUser.uid,
      //     'isStudent': globals.reduxStore.state.isStudentPayload,
      //     'totalEarnedHours': globals.reduxStore.state.earnedHoursPayload,
      //   }).then((value) {
      //     if (kDebugMode) {
      //       print('\x1B[33mUser\'s data are updated successfully\x1B[0m');
      //     }
      //     globals.reduxStore.dispatch(ToggleEditingUserAction(false));
      //     globals.reduxStore.dispatch(FetchExtraUserInfoAction(uid: globals.reduxStore.state.user!.firebaseUser.uid));
      //   });
      // }
    }).catchError((error) {
      // error.
      // store.dispatch(XxxxxxFailedAction(error));
    });
  } else if (action is FetchExtraUserInfoAction) {
    /*
    TODO: rebuild
    if (!_loggedIn) {
      throw Exception('Must be logged in');
    }
    * */

    FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: action.uid).get().then((documentSnapshot) {
      if (documentSnapshot.docs.isNotEmpty) {
        bool? isStudent;
        int? totalEarnedHours;
        String? username;
        // if (documentSnapshot.docs[0].data().containsKey('isStudent')) {
        isStudent = documentSnapshot.docs[0]['isStudent'];
        // }
        // if (documentSnapshot.docs[0].data().containsKey('totalEarnedHours')) {
        totalEarnedHours = documentSnapshot.docs[0]['totalEarnedHours'];
        // }
        // if (documentSnapshot.docs[0].data().containsKey('displayName')) {
        username = documentSnapshot.docs[0]['displayName'];
        print('*****************************************************************************Name:');
        print(username);
        // }

        store.dispatch(FetchExtraUserInfoSucceededAction(
          username: username,
          isStudent: isStudent,
          totalEarnedHours: totalEarnedHours,
        ));
      }
    }).catchError((error) {
      print('\x1B[31m ERORR!!!!!!!!!!!!!!!!!!ERROR!!!!!!!!!!!!!!!!1 \x1B[0m');
      print(error);

      store.dispatch(FetchExtraUserInfoFailedAction(error));
    });
  }
  next(action);
}
