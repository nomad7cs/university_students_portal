import 'package:flutter/material.dart';
import 'package:univ_port_app/app_redux/actions.dart';
import 'package:univ_port_app/globals.dart' as globals;
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
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
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
      ),
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
