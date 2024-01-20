import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/app_drawer.dart';
import 'package:univ_port_app/custom_appbar.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(text: 'Project: ', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 30)),
                        TextSpan(
                            text: () {
                              final Faker faker = Faker();
                              return '${faker.lorem.words(5).join(' ')}\n';
                            }(),
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                        const TextSpan(text: 'Supervisor: ', style: TextStyle(fontSize: 25)),
                        TextSpan(
                            text: () {
                              final Faker faker = Faker();
                              return 'Dr. ${faker.person.firstName()} ${faker.person.lastName()}';
                            }(),
                            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                // Flexible(
                //   fit: FlexFit.loose,
                //   child: Wrap(
                //     spacing: 5.0,
                //     children: [
                //       Chip(
                //         avatar: CircleAvatar(backgroundImage: NetworkImage(() {
                //           final Faker faker = Faker();
                //           return faker.image.image(keywords: [
                //             'account',
                //             'male',
                //           ], random: true);
                //         }())),
                //         label: Text(() {
                //           final Faker faker = Faker();
                //           return faker.person.name();
                //         }()),
                //       ),
                //       Chip(
                //         avatar: CircleAvatar(backgroundImage: NetworkImage(() {
                //           final Faker faker = Faker();
                //           // print('${faker.date.month()} / ${faker.date.year()}');
                //           return faker.image.image(keywords: [
                //             'account',
                //             'male',
                //           ], random: true);
                //         }())),
                //         label: Text(() {
                //           final Faker faker = Faker();
                //           return faker.person.name();
                //         }()),
                //       ),
                //       Chip(
                //         avatar: CircleAvatar(backgroundImage: NetworkImage(() {
                //           final Faker faker = Faker();
                //           return faker.image.image(keywords: [
                //             'account',
                //             'male',
                //           ], random: true);
                //         }())),
                //         label: Text(() {
                //           final Faker faker = Faker();
                //           return faker.person.name();
                //         }()),
                //       ),
                //       Chip(
                //         avatar: CircleAvatar(backgroundImage: NetworkImage(() {
                //           final Faker faker = Faker();
                //           return faker.image.image(keywords: [
                //             'account',
                //             'male',
                //           ], random: true);
                //         }())),
                //         label: Text(() {
                //           final Faker faker = Faker();
                //           return faker.person.name();
                //         }()),
                //       ),
                //       Chip(
                //         avatar: CircleAvatar(backgroundImage: NetworkImage(() {
                //           final Faker faker = Faker();
                //           return faker.image.image(keywords: [
                //             'account',
                //             'male',
                //           ], random: true);
                //         }())),
                //         label: Text(() {
                //           final Faker faker = Faker();
                //           return faker.person.name();
                //         }()),
                //       ),
                //     ],
                //   ),
                // ),
                const Wrap(
                  spacing: 5.0,
                  children: [
                    ProjectStudentMemberChip(),
                    ProjectStudentMemberChip(),
                    ProjectStudentMemberChip(),
                    ProjectStudentMemberChip(),
                    ProjectStudentMemberChip(),
                  ],
                ),
                const SizedBox(height: 15.0),
                () {
                  var random = Random(); // Use Random() for general purposes
                  int minYear = 2010;
                  int maxYear = 2023;
                  int randomYear = minYear + random.nextInt(maxYear - minYear + 1);
                  // print("Random integer: $randomYear");
                  int minMonth = 1;
                  int maxMonth = 12;
                  int randomMonth = minMonth + random.nextInt(maxMonth - minMonth + 1);
                  return Text('$randomMonth - $randomYear');
                }(),
                const Divider(),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Introduction', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                    Expanded(child: Container()),
                    SizedBox(
                      height: 250.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7.0),
                        child: Image(
                          image: NetworkImage(() {
                            final Faker faker = Faker();
                            return faker.image.image(keywords: ['computer science', 'project'], random: true);
                          }()),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(() {
                  final Faker faker = Faker();
                  return faker.lorem.words(100).join(' ');
                }()),
                const SizedBox(height: 15.0),
                const Text('Lorem:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7.0),
                        child: Image(
                          image: NetworkImage(() {
                            final Faker faker = Faker();
                            return faker.image.image(keywords: ['computer science', 'project'], random: true);
                          }()),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(() {
                        final Faker faker = Faker();
                        return faker.lorem.words(100).join(' ');
                      }()),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Lorem2:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                Flexible(
                    fit: FlexFit.loose,
                    child: Text(() {
                      final Faker faker = Faker();
                      return faker.lorem.words(150).join(' ');
                    }())),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7.0),
                        child: Image(
                          image: NetworkImage(() {
                            final Faker faker = Faker();
                            return faker.image.image(keywords: ['computer science', 'project'], random: true);
                          }()),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Flexible(
                    fit: FlexFit.loose,
                    child: Text(() {
                      final Faker faker = Faker();
                      return faker.lorem.words(150).join(' ');
                    }())),
                const SizedBox(height: 15.0),
                const Text('Lorem3:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7.0),
                        child: Image(
                          image: NetworkImage(() {
                            final Faker faker = Faker();
                            return faker.image.image(keywords: ['computer science', 'project'], random: true);
                          }()),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(() {
                        final Faker faker = Faker();
                        return faker.lorem.words(200).join(' ');
                      }()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectStudentMemberChip extends StatelessWidget {
  const ProjectStudentMemberChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(backgroundImage: NetworkImage(() {
        final Faker faker = Faker();
        return faker.image.image(keywords: [
          'account',
          'male',
        ], random: true);
      }())),
      label: Text(() {
        final Faker faker = Faker();
        return '${faker.person.firstName()} ${faker.person.lastName()}';
      }()),
    );
  }
}
