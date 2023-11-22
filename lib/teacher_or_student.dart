import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/app_redux/actions.dart';
import 'package:univ_port_app/globals.dart' as globals;

class TeacherOrStudent extends StatefulWidget {
  const TeacherOrStudent({super.key});

  @override
  State<TeacherOrStudent> createState() => _TeachOrStudent();
}

class _TeachOrStudent extends State<TeacherOrStudent> {
  bool? _isStudent;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    globals.reduxStore.onChange.listen((event) {
      this._isStudent = event.isStudent!;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this._isStudent == null) {
      if (kDebugMode) {
        print(' nulllllll            ______________whyyyyyyyyyy');
      }
      return const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_box_outline_blank),
          Text('Student'),
          SizedBox(width: 25.0),
          Icon(Icons.check_box_outline_blank),
          Text('Teacher'),
        ],
      );
    } else if (this._isStudent == true) {
      print('it hassss __________________-data');
      return const Row(
        children: [
          Icon(Icons.check_box),
          Text('Student'),
          SizedBox(width: 25.0),
          Icon(Icons.check_box_outline_blank),
          Text('Teacher'),
        ],
      );
    } else {
      return const Row(
        children: [
          Icon(Icons.check_box_outline_blank),
          Text('Student'),
          SizedBox(width: 25.0),
          Icon(Icons.check_box),
          Text('Teacher'),
        ],
      );
    }

    // return Row(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //
    //
    //
    //
    //
    //     StreamBuilder<bool?>(
    //         stream: globals.reduxStore.onChange.map((state) => state.isStudent),
    //         builder: (context, snapshot) {
    //           if (!snapshot.hasData || snapshot.data == null) {
    //             if (kDebugMode) {
    //               if (snapshot.data == null) print(' nulllllll            ______________whyyyyyyyyyy');
    //               if (!snapshot.hasData) print('no Data ____________why');
    //             }
    //             return const Row(
    //               children: [
    //                 Icon(Icons.check_box_outline_blank),
    //                 Text('Student'),
    //                 SizedBox(width: 25.0),
    //                 Icon(Icons.check_box_outline_blank),
    //                 Text('Teacher'),
    //               ],
    //             );
    //           } else if (snapshot.data == true) {
    //             print('it hassss __________________-data');
    //             return const Row(
    //               children: [
    //                 Icon(Icons.check_box),
    //                 Text('Student'),
    //                 SizedBox(width: 25.0),
    //                 Icon(Icons.check_box_outline_blank),
    //                 Text('Teacher'),
    //               ],
    //             );
    //           } else {
    //             return const Row(
    //               children: [
    //                 Icon(Icons.check_box_outline_blank),
    //                 Text('Student'),
    //                 SizedBox(width: 25.0),
    //                 Icon(Icons.check_box),
    //                 Text('Teacher'),
    //               ],
    //             );
    //           }
    //         }),
    //   ],
    // );
  }
}

class EditTeacherOrStudent extends StatefulWidget {
  const EditTeacherOrStudent({super.key});

  @override
  State<EditTeacherOrStudent> createState() => _EditTeacherOrStudentState();
}

class _EditTeacherOrStudentState extends State<EditTeacherOrStudent> {
  bool? _isStudent;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    globals.reduxStore.onChange.listen((event) {
      this._isStudent = event.isStudent!;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this._isStudent == null) {
      return Row(
        children: [
          IconButton(
              onPressed: () {
                globals.reduxStore.dispatch(SetTypeStudentPayloadAction(true));
              },
              icon: const Icon(Icons.check_box_outline_blank)),
          const Text('Student'),
          const SizedBox(width: 25.0),
          IconButton(
              onPressed: () {
                globals.reduxStore.dispatch(SetTypeStudentPayloadAction(false));
              },
              icon: const Icon(Icons.check_box_outline_blank)),
          const Text('Teacher'),
        ],
      );
    } else if (_isStudent == false) {
      return Row(
        children: [
          IconButton(
              onPressed: () {
                globals.reduxStore.dispatch(SetTypeStudentPayloadAction(true));
              },
              icon: const Icon(Icons.check_box_outline_blank)),
          const Text('Student'),
          const SizedBox(width: 25.0),
          IconButton(
              onPressed: () {
                globals.reduxStore.dispatch(SetTypeStudentPayloadAction(false));
              },
              icon: const Icon(Icons.check_box)),
          const Text('Teacher'),
        ],
      );
    } else {
      return Row(
        children: [
          IconButton(
              onPressed: () {
                // globals.reduxStore.dispatch(ExitEditStudentTypeAction());
                globals.reduxStore.dispatch(SetTypeStudentPayloadAction(false));
              },
              icon: const Icon(Icons.check_box)),
          const Text('Student'),
          const SizedBox(width: 25.0),
          IconButton(
              onPressed: () {
                globals.reduxStore.dispatch(SetTypeStudentPayloadAction(false));
              },
              icon: const Icon(Icons.check_box_outline_blank)),
          const Text('Teacher'),
        ],
      );
    }
    /*Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ,
        const Text('Student'),
        const SizedBox(width: 25.0),
        const Icon(Icons.check_box_outline_blank),
        const Text('Teacher'),
        IconButton(onPressed: (){}, icon: Icon(Icons.check_box_outline_blank)),
        const Text('Student'),
        const SizedBox(width: 25.0),
        const Icon(Icons.check_box_outline_blank),
        const Text('Teacher'),
      ],
    );*/
  }
}
