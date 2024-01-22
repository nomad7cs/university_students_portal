import 'dart:async';

import 'package:flutter/material.dart';
import 'package:univ_port_app/app_redux/actions.dart';
import 'package:univ_port_app/globals.dart' as globals;

import '../app_drawer.dart';
import '../custom_appbar.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  late String? serviceName;
  late StreamSubscription _subscription;
  int? _minRequiredHours;
  int? _creditHours;

  @override
  void initState() {
    super.initState();
    globals.reduxStore.dispatch(FetchExtraUserInfoAction(uid: globals.reduxStore.state.user!.firebaseUser.uid));
    _subscription = globals.reduxStore.onChange.listen((event) {
      setState(() {
        serviceName = event.currentServiceName;
        _minRequiredHours = event.currentServiceMinRequiredHours;
        _creditHours = event.totalEarnedHours ?? 0;
      });
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
      body: Stack(
        children: [
          Container(
            width: double.infinity, // Expand to full screen width
            child: const Image(
              image: AssetImage("assets/img/Library-2-1-1280x853.jpg"),
              // opacity: AlwaysStoppedAnimation(0.8),
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Container(
                // alignment: Alignment.center,
                color: const Color.fromARGB(255, 188, 233, 255).withOpacity(0.5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                serviceName ?? '',
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
                          if ((creditHours != null) && (_minRequiredHours != null) && (creditHours >= _minRequiredHours!)) {
                            return Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Min Required hours: ${_minRequiredHours.toString()}'),
                                ),
                                Row(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(15),
                                        width: 170,
                                        child: const LinearProgressIndicator(
                                          color: Colors.deepOrange,
                                          backgroundColor: Colors.black38,
                                          value: 0.5,
                                        ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: const Text('Progress: 50%'),
                                    )
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('Proceed to payment, please!'),
                                  ],
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Min Required hours: ${_minRequiredHours.toString()}'),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(15),
                                      width: 170,
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
                        // const CircleAvatar(
                        //   radius: 75,
                        //   backgroundImage: AssetImage('assets/img/gear-computer-icons-symbol-follow-up-org.png'),
                        //   // backgroundColor: Colors.brown.shade800,
                        //   // child: const Text('HR'),
                        // ),
                        // const SizedBox(
                        //   height: 10.0,
                        // ),
                        // TextButton(onPressed: () {}, child: const Text('Request Follow Up')),
                        const SizedBox(
                          height: 50.0,
                        ),
                        () {
                          if ((_creditHours != null) && (_minRequiredHours != null) && (_creditHours! >= _minRequiredHours!)) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FilledButton(
                                  onPressed: () {
                                    globals.reduxStore.dispatch(NavigateToUrlAction('/payment'));
                                  },
                                  child: const Text('Payment'),
                                ),
                                const SizedBox(
                                  height: 100.0,
                                ),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        }(),
                        const Icon(Icons.history_edu, size: 70),
                        TextButton(
                            onPressed: () {
                              globals.reduxStore.dispatch(NavigateToUrlAction('/services'));
                            },
                            child: const Text('Go to All Services')),
                      ],
                    ),
                    // VerticalDivider(),
                    // Divider(),
                    // Flexible(
                    //   child: Wrap(
                    //     // mainAxisAlignment: MainAxisAlignment.start,
                    //     // mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       SizedBox(
                    //         height: 900.0,
                    //         width: 900.0,
                    //         child: ClipRRect(
                    //           borderRadius: BorderRadius.circular(7.0),
                    //           child: Image(
                    //             image: NetworkImage(() {
                    //               final Faker faker = Faker();
                    //               return faker.image.image(keywords: ['computer', 'science', 'subject'], random: true);
                    //             }()),
                    //             fit: BoxFit.contain,
                    //             // fit: BoxFit.none,
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         height: 520.0,
                    //         width: 520.0,
                    //         child: ClipRRect(
                    //           borderRadius: BorderRadius.circular(7.0),
                    //           child: Image(
                    //             image: NetworkImage(() {
                    //               final Faker faker = Faker();
                    //               return faker.image.image(keywords: ['computer', 'science', 'subject'], random: true);
                    //             }()),
                    //             fit: BoxFit.contain,
                    //             // fit: BoxFit.none,
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         height: 920.0,
                    //         width: 920.0,
                    //         child: ClipRRect(
                    //           borderRadius: BorderRadius.circular(7.0),
                    //           child: Image(
                    //             image: NetworkImage(() {
                    //               final Faker faker = Faker();
                    //               return faker.image.image(keywords: ['computer', 'science', 'subject'], random: true);
                    //             }()),
                    //             fit: BoxFit.contain,
                    //             // fit: BoxFit.none,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
