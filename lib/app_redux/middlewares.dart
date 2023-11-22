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
  } else if (action is SaveIsStudentAction) {
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
        .then((event) {
      if (event.docs.isNotEmpty) {
        event.docs[0].reference.update({'isStudent': globals.reduxStore.state.isStudentPayload}).then((value) {
          globals.reduxStore.dispatch(FetchExtraUserInfoAction(uid: globals.reduxStore.state.user!.firebaseUser.uid));
          globals.reduxStore.dispatch(ToggleEditingUserTypeAction());
        });
      } else {
        FirebaseFirestore.instance.collection('users').doc().set({
          'uid': globals.reduxStore.state.user?.firebaseUser.uid,
          'isStudent': globals.reduxStore.state.isStudentPayload
        }).then((value) {
          globals.reduxStore.dispatch(FetchExtraUserInfoAction(uid: globals.reduxStore.state.user!.firebaseUser.uid));
          globals.reduxStore.dispatch(ToggleEditingUserTypeAction());
        });
      }
    }).catchError((error) {
      // store.dispatch(XxxxxxFailedAction(error));
    });
  } else if (action is FetchExtraUserInfoAction) {
    /*
    TODO: rebuild
    if (!_loggedIn) {
      throw Exception('Must be logged in');
    }
    * */

    FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: action.uid).get().then((event) {
      if (event.docs.isNotEmpty) {
        if (kDebugMode) {
          print('event.docs[0][isStudent]:');
          print(event.docs[0]['isStudent']);
        }
        store.dispatch(FetchExtraUserInfoSucceededAction(event.docs[0]['isStudent']));
      }
    }).catchError((error) {
      store.dispatch(FetchExtraUserInfoFailedAction(error));
    });
  }
  next(action);
}
