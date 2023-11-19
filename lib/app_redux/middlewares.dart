import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:redux/redux.dart';
import 'package:univ_port_app/app_redux/app_state.dart';

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
  }
  next(action);
}
