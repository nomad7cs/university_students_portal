import 'package:flutter/material.dart';
import 'package:univ_port_app/service_card.dart';
import 'app_drawer.dart';

class RequestScreen extends StatefulWidget {
  final String serviceName;
  const RequestScreen({super.key, required this.serviceName});

  // final String title;

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: ,
        elevation: 4,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_none), // Icons.notification_important
            tooltip: 'Notifications',
            onPressed: null,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: true
                ? IconButton(
                    icon: Icon(Icons.account_circle),
                    onPressed: () {},
                  )
                : IconButton(
                    icon: Icon(Icons.login),
                    onPressed: () {},
                  ),
          ),
        ],
      ),
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
                        padding: EdgeInsets.all(15),
                        child: Text(widget.serviceName,
                          style: TextStyle(
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
                        padding: EdgeInsets.all(15),
                        width: 170,
                        // height: 20,
                        // color: Colors.grey,
                        child: LinearProgressIndicator(
                          color: Colors.deepOrange,
                          backgroundColor: Colors.black38,
                          value: 0.5,
                        ),),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Text('Progress: 50%'),
                      )
                    ],
                  ),

                  // Text('Request Follow Up')
                  CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/img/gear-computer-icons-symbol-follow-up-org.png'),
                    // backgroundColor: Colors.brown.shade800,
                    // child: const Text('HR'),
                  ),
                  SizedBox(height: 10.0,),
                  TextButton(onPressed: (){}, child: Text('Request Follow Up')),
                  SizedBox(height: 50.0,),
                  FilledButton(onPressed: (){}, child: Text('Check')),
                  SizedBox(height: 50.0,),
                  FilledButton(onPressed: (){}, child: Text('Payment')),
                  SizedBox(height: 100.0,),
                  Icon(Icons.history_edu, size: 70),
                  TextButton(onPressed: (){}, child: Text('Go to All Services')),

                  //  Check
                  // Upload Files
                  // Update Data
                ],
              )
          )
      ),
    );
  }
}
