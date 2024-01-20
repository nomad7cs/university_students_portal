import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:univ_port_app/globals.dart' as globals;
import 'package:univ_port_app/models/teachers.dart';
import 'package:univ_port_app/models/university_user.dart';

class DashboardGreetings extends StatefulWidget {
  final UniversityUser user;
  const DashboardGreetings({super.key, required this.user});

  @override
  State<DashboardGreetings> createState() => _DashboardGreetingsState();
}

class _DashboardGreetingsState extends State<DashboardGreetings> {
  // late StreamSubscription _subscription;
  String? _username = globals.reduxStore.state.username;

  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _subscription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
            flex: 5,
            fit: FlexFit.loose,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: () {
                            String prefix = ' ';
                            if (widget.user is Teacher) {
                              return prefix = 'Welcome back, Dr. ';
                            } else {
                              return prefix = 'Welcome back, ';
                            }
                            return '$prefix${widget.user.displayName}!';
                          }(),
                          // style: TextStyle(fontWeight: FontWeight.bold),
                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                        ),
                        TextSpan(
                          text: widget.user.displayName,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                        ),
                      ]),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      formattedDate,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
                    ),
                  ),
                ),
              ],
            )),
        Flexible(
          flex: 3,
          fit: FlexFit.loose,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  //   width: 170,
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
              ),
              const SizedBox(width: 5),
              const Icon(Icons.notifications_none)
            ],
          ),
        ),
      ],
    );
  }
}
