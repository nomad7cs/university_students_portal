import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/app_redux/actions.dart';
import 'package:univ_port_app/dashboards/greetings.dart';
import 'package:univ_port_app/globals.dart' as globals;
import 'package:univ_port_app/models/admins.dart';

class AdminDashboard extends StatefulWidget {
  final AdminUser admin;
  const AdminDashboard({super.key, required this.admin});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DashboardGreetings(user: widget.admin),
        const SizedBox(height: 10.0),
        ...() {
          if (widget.admin is AdminUser) {
            return [
              Flexible(
                fit: FlexFit.loose,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Material(
                      elevation: 4.0,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.blue[50],
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200.0,
                              height: 200.0,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7.0),
                                  child: const Image(
                                    image: AssetImage('assets/img/senior-citizen.png'),
                                    fit: BoxFit.fitWidth,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton(
                              onPressed: () {
                                globals.reduxStore.dispatch(NavigateToUrlAction('/edit_teachers_and_students'));
                              },
                              child: const Text('Edit Teacher & Students'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Material(
                      elevation: 4.0,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.blue[50],
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200.0,
                              height: 200.0,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7.0),
                                  child: const Image(
                                    image: AssetImage('assets/img/coursesedit.jpg'),
                                    fit: BoxFit.fitWidth,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton(
                              onPressed: () {
                                globals.reduxStore.dispatch(NavigateToUrlAction('/edit_courses'));
                              },
                              child: const Text('Edit Courses data'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Material(
                      elevation: 4.0,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.blue[50],
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 200.0,
                              height: 200.0,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7.0),
                                  child: const Image(
                                    image: AssetImage('assets/img/project.png'),
                                    fit: BoxFit.fitWidth,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton(
                              onPressed: () {
                                globals.reduxStore.dispatch(NavigateToUrlAction('/projects'));
                              },
                              child: const Text('Edit Projects data'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
              const Divider(),
              const SizedBox(height: 5.0),
              const Flexible(
                fit: FlexFit.loose,
                child: Wrap(
                  children: [
                    FillerImage(),
                    FillerImage(),
                    FillerImage(),
                    FillerImage(),
                    FillerImage(),
                  ],
                ),
              )
            ];
          } else {
            return [Container()];
          }
        }(),
      ],
    );
  }
}

class FillerImage extends StatelessWidget {
  const FillerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7.0),
        child: Image(
          image: NetworkImage(() {
            final Faker faker = Faker();
            return faker.image.image(keywords: ['computer science', 'campus'], random: true);
          }()),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
