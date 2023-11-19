import 'package:flutter/material.dart';

import '../app_drawer.dart';
import '../custom_appbar.dart';

class RequestScreen extends StatelessWidget {
  final String serviceName;

  const RequestScreen({super.key, required this.serviceName});

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
                          serviceName,
                          style: const TextStyle(
                            // color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                          value: 0.5,
                        ),
                      ),
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
