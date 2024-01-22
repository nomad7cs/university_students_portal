import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:univ_port_app/app_redux/actions.dart';
import 'package:univ_port_app/globals.dart' as globals;
import 'package:univ_port_app/models/teachers.dart';
import 'package:univ_port_app/models/university_user.dart';

class TodayClasses extends StatefulWidget {
  final UniversityUser user;
  const TodayClasses({super.key, required this.user});

  @override
  State<TodayClasses> createState() => _TodayClassesState();
}

class _TodayClassesState extends State<TodayClasses> {
  @override
  initState() {
    super.initState();
    globals.reduxStore.dispatch(FetchTodayClassesAction());
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    Timestamp todayTimestamp = Timestamp.fromDate(now);
    Timestamp tomorrowTimestamp = Timestamp.fromDate(now.add(Duration(days: 1)));

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: StreamBuilder(stream: () {
        if (widget.user is Teacher) {
          return FirebaseFirestore.instance
              .collection('calendar')
              // .where('schedule', isGreaterThanOrEqualTo: todayTimestamp)
              // .where('schedule', isLessThan: tomorrowTimestamp)
              .where('teacherId', isEqualTo: widget.user.uid)
              .orderBy('schedule')
              .snapshots();
        } else {
          return FirebaseFirestore.instance
              .collection('calendar')
              // .where('schedule', isGreaterThanOrEqualTo: todayTimestamp)
              // .where('schedule', isLessThan: tomorrowTimestamp)
              .where('students', arrayContains: widget.user.uid)
              .orderBy('schedule')
              .snapshots();
        }
      }(), builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> asyncSnapshot) {
        ///////////// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        List<Widget> children;
        if (asyncSnapshot.hasError) {
          if (kDebugMode) {
            print(asyncSnapshot.error);
          }
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 16),
            //   child: Text('Error: ${asyncSnapshot.error}'),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 8),
            //   child: Text('Stack trace: ${asyncSnapshot.stackTrace}'),
            // ),
          ];
        } else {
          switch (asyncSnapshot.connectionState) {
            case ConnectionState.none:
              children = const <Widget>[
                Icon(
                  Icons.info,
                  color: Colors.blue,
                  size: 60,
                ),
                // Padding(
                //   padding: EdgeInsets.only(top: 16),
                //   child: Text('Select a lot'),
                // ),
              ];
            case ConnectionState.waiting:
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting for database...'),
                ),
              ];
            case ConnectionState.active:
              children = <Widget>[
                const Text(
                  'Today\'s Schedule',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30),
                ),
                const SizedBox(height: 10),
                ...asyncSnapshot.data!.docs.map((e) => Flexible(
                      fit: FlexFit.loose,
                      child: /*Card(
                        elevation: 3,
                        child: ListTile(
                          title: Text(() {
                            DateFormat formatter = DateFormat('hh:mm a');
                            return formatter.format(e.data()['schedule'].toDate());
                          }()),
                          subtitle: Text(e.data()['location']),
                        ),
                      ),*/
                          Container(
                        margin: const EdgeInsets.all(5),
                        child: Material(
                            elevation: 4.0,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            color: Colors.blue[50],
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    fit: FlexFit.loose,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Text(() {
                                            DateFormat formatter = DateFormat('hh:mm a');
                                            return formatter.format(e.data()['schedule'].toDate());
                                          }()),
                                        ),
                                        Flexible(child: Text(e.data()['location'])),
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Flexible(
                                      flex: 1,
                                      fit: FlexFit.loose,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [Text(e.data()['courseCode'])],
                                      ))
                                ],
                              ),
                            )),
                      ),
                      // child: Text(e.data()['location']),
                    )),
              ];
            case ConnectionState.done:
              children = <Widget>[
                const Icon(
                  Icons.info,
                  color: Colors.blue,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('\$${asyncSnapshot.data} (closed)'),
                ),
              ];
          }
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: children,
        );
        ///////////VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'Today\'s Schedule',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
              ),
            ),
            // ...widget.student.courses.map((e) {
            //   return ClassScheduleCard(
            //     className: '${e.course.fullName} - ${e.course.code}',
            //     teacherName: e.teacher,
            //     schedule: '${e.dateTime} -- ${e.location}',
            //     picturePath: e.course.img ?? '',
            //     duration: e.duration,
            //     participants: '${e.participants} Participants',
            //     credit: '${e.credit} Credit',
            //   );
            // })
          ],
        );
      }),
    );
    // return StreamBuilder<List<ClassroomSlot>?>(
    //     stream: globals.reduxStore.onChange.map((event) => event.todayCourses),
    //     builder: (context, snapshot) {
    //       if ((snapshot.data != null) && snapshot.data!.isNotEmpty) {
    //         return Container(
    //           padding: const EdgeInsets.all(10.0),
    //           decoration: BoxDecoration(
    //             border: Border.all(width: 0.5, color: Colors.grey),
    //             borderRadius: const BorderRadius.all(Radius.circular(20)),
    //           ),
    //           child: Column(
    //             children: [
    //               Container(
    //                 padding: const EdgeInsets.all(10.0),
    //                 child: const Text(
    //                   'Today\'s Schedule',
    //                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
    //                 ),
    //               ),
    //               ...?snapshot.data?.map((e) {
    //                 return ClassScheduleCard(
    //                   className: '${e.course.fullName} - ${e.course.code}',
    //                   teacherName: e.teacher,
    //                   schedule: '${e.dateTime} -- ${e.location}',
    //                   picturePath: e.course.img ?? '',
    //                   duration: e.duration,
    //                   participants: '${e.participants} Participants',
    //                   credit: '${e.credit} Credit',
    //                 );
    //               })
    //             ],
    //           ),
    //         );
    //       }
    //       return const Center(
    //         heightFactor: 7,
    //         child: CircularProgressIndicator(
    //           value: null,
    //         ),
    //       );
    //     });
  }
}

// children: [
//   Container(
//     padding: const EdgeInsets.all(10.0),
//     child: const Text(
//       'Today\'s Schedule',
//       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
//     ),
//   ),
//   ClassScheduleCard(
//     className: 'Operating Systems - CS 400',
//     teacherName: 'Dr. Ahmad Abdallah',
//     schedule: '16:00 - SS 202 TH',
//     picturePath: 'assets/img/os-mini-logo.jpg',
//     duration: '3 Hours',
//     participants: '33 Participants',
//     credit: '3 Credit',
//   ),
// ],
