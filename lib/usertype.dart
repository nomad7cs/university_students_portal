import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/app_redux/actions.dart';
import 'package:univ_port_app/globals.dart' as globals;

class UserType extends StatefulWidget {
  const UserType({super.key});

  @override
  State<UserType> createState() => _UserType();
}

class _UserType extends State<UserType> {
  late StreamSubscription _subscription;
  bool? _isStudent = globals.reduxStore.state.isStudent;

  @override
  void initState() {
    super.initState();
    _subscription = globals.reduxStore.onChange.listen((event) {
      setState(() {
        _isStudent = event.isStudent;
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isStudent == null) {
      return const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_box_outline_blank),
          Text('Student'),
          SizedBox(width: 25.0),
          Icon(Icons.check_box_outline_blank),
          Text('Teacher'),
        ],
      );
    } else if (_isStudent == true) {
      return const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_box_outline_blank),
          Text('Student'),
          SizedBox(width: 25.0),
          Icon(Icons.check_box),
          Text('Teacher'),
        ],
      );
    }
  }
}

class EditUserType extends StatefulWidget {
  const EditUserType({super.key});

  @override
  State<EditUserType> createState() => _EditUserTypeState();
}

class _EditUserTypeState extends State<EditUserType> {
  late StreamSubscription _subscription;
  bool? _isStudent = globals.reduxStore.state.isStudent;
  bool? _payload;

  @override
  void initState() {
    super.initState();
    _subscription = globals.reduxStore.onChange.listen((event) {
      setState(() {
        _isStudent = event.isStudent;
        if (event.isStudentPayload == null) {
          _payload = event.isStudent;
        } else {
          _payload = event.isStudentPayload;
        }
        if (kDebugMode) {
          print('\x1B[31mNew State into EditUserType\x1B[0m');
          print('\x1B[31mPayload: $_payload\x1B[0m');
        }
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('\x1B[31mRebuilding EditUserType\x1B[0m');
    }
    if (_payload == null) {
      if (_isStudent == null) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
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
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  globals.reduxStore.dispatch(SetTypeStudentPayloadAction(true));
                },
                icon: const Icon(Icons.check_box_outline_blank)),
            const Text('Student'),
            const SizedBox(width: 25.0),
            const IconButton(onPressed: null, icon: Icon(Icons.check_box)),
            const Text('Teacher'),
          ],
        );
      } else {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const IconButton(onPressed: null, icon: Icon(Icons.check_box)),
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
    } else {
      if (_payload == true) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const IconButton(onPressed: null, icon: Icon(Icons.check_box)),
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
      } else {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  globals.reduxStore.dispatch(SetTypeStudentPayloadAction(true));
                },
                icon: const Icon(Icons.check_box_outline_blank)),
            const Text('Student'),
            const SizedBox(width: 25.0),
            const IconButton(onPressed: null, icon: Icon(Icons.check_box)),
            const Text('Teacher'),
          ],
        );
      }
    }
  }
}
