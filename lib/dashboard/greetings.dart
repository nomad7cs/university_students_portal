import 'dart:async';

import 'package:flutter/material.dart';
import 'package:univ_port_app/globals.dart' as globals;

class DashboardGreetings extends StatefulWidget {
  const DashboardGreetings({super.key});

  @override
  State<DashboardGreetings> createState() => _DashboardGreetingsState();
}

class _DashboardGreetingsState extends State<DashboardGreetings> {
  late StreamSubscription _subscription;
  String? _username;

  @override
  void initState() {
    super.initState();
    _subscription = globals.reduxStore.onChange.listen((event) {
      setState(() {
        _username = event.user?.firebaseUser.displayName;
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
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Hello, ${_username ?? ""}',
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    '2-10-2023',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
                  ),
                ),
              ],
            )),
        Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 170,
                  height: 35,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                        ),
                        labelText: 'Search',
                        prefixIcon: const Icon(Icons.search)),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.notifications_none)
              ],
            )),
      ],
    );
  }
}
