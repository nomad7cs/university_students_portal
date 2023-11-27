import 'dart:async';

import 'package:flutter/material.dart';
import 'package:univ_port_app/app_redux/actions.dart';
import 'package:univ_port_app/globals.dart' as globals;

import '../app_drawer.dart';
import '../custom_appbar.dart';

class RequestScreen extends StatefulWidget {
  final String serviceName;

  const RequestScreen({super.key, required this.serviceName});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  late StreamSubscription _subscription;
  // int? _payload;
  int? creditHours;

  @override
  void initState() {
    super.initState();
    globals.reduxStore.dispatch(FetchExtraUserInfoAction(uid: globals.reduxStore.state.user!.firebaseUser.uid));
    _subscription = globals.reduxStore.onChange.listen((event) {
      creditHours = event.totalEarnedHours ?? 0;
      // if (event.earnedHoursPayload == null) {
      //   _payload = event.totalEarnedHours;
      // } else {
      //   _payload = event.earnedHoursPayload;
      // }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SafeArea(
          top: true,
          child: Container(
              alignment: Alignment.center,
              // width: double.infinity,
              color: const Color.fromARGB(255, 188, 233, 255),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          widget.serviceName,
                          style: const TextStyle(
                            // color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  () {
                    int? creditHours = globals.reduxStore.state.totalEarnedHours;
                    if ((creditHours != null) && (creditHours > 100)) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                width: 170,
                                // height: 20,
                                // color: Colors.grey,
                                child: const LinearProgressIndicator(
                                  color: Colors.deepOrange,
                                  backgroundColor: Colors.black38,
                                  value: 1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 15),
                                child: const Text('Progress: 100%'),
                              )
                            ],
                          ),
                          const Row(
                            children: [
                              Text('Your request is ready to deliver!'),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                width: 170,
                                // height: 20,
                                // color: Colors.grey,
                                child: const LinearProgressIndicator(
                                  color: Colors.deepOrange,
                                  backgroundColor: Colors.black38,
                                  value: 0.3,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 15),
                                child: const Text('Progress: 30%'),
                              )
                            ],
                          ),
                          const Row(
                            children: [
                              Text('Your total credit hours is below required!'),
                            ],
                          ),
                        ],
                      );
                    }
                  }(),

                  // Text('Request Follow Up')
                  const CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/img/gear-computer-icons-symbol-follow-up-org.png'),
                    // backgroundColor: Colors.brown.shade800,
                    // child: const Text('HR'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextButton(onPressed: () {}, child: const Text('Request Follow Up')),
                  const SizedBox(
                    height: 50.0,
                  ),
                  FilledButton(onPressed: () {}, child: const Text('Check')),
                  const SizedBox(
                    height: 50.0,
                  ),
                  FilledButton(onPressed: () {}, child: const Text('Payment')),
                  const SizedBox(
                    height: 100.0,
                  ),
                  const Icon(Icons.history_edu, size: 70),
                  TextButton(onPressed: () {}, child: const Text('Go to All Services')),

                  //  Check
                  // Upload Files
                  // Update Data
                ],
              ))),
    );
  }
}
