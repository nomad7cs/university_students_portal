import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/app_drawer.dart';
import 'package:univ_port_app/custom_appbar.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final bool isSmallScreen = mediaQuery.size.width < 600.0;
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(100),
      //   child: CustomAppBar(),
      // ),
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SafeArea(
        top: true,

        child: SingleChildScrollView(child: () {
          if (isSmallScreen) {
            return Container(
              padding: const EdgeInsets.all(5.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Flexible(fit: FlexFit.loose, child: DashboardDetails()),
                  SizedBox(height: 10.0),
                  // Flexible(fit: FlexFit.loose, child: Upcomings()),
                ],
              ),
            );
          } else {
            return Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Text('Graduation Projects\n', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                  const Divider(),
                  const Flexible(child: Project()),
                ],
              ),
            );
          }
        }()),
        // ),
      ),
    );
  }
}

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: Image(
              image: NetworkImage(() {
                final Faker faker = Faker();
                return faker.image.image(keywords: ['science', 'project'], random: true);
              }()),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                // style: DefaultTextStyle.of(context).style, // Base style
                children: <TextSpan>[
                  const TextSpan(text: 'Project Name: ', style: TextStyle(fontSize: 15)),
                  TextSpan(
                    text: '${() {
                      final Faker faker = Faker();
                      return faker.lorem.words(5);
                    }()}\n',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: 'Supervisor: ', style: TextStyle(fontSize: 15)),
                  TextSpan(
                      text: 'Dr. ${() {
                        final Faker faker = Faker();
                        return faker.person.name();
                      }()}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            Flexible(
                child: Wrap(
              spacing: 5.0,
              children: [
                Chip(
                  avatar: CircleAvatar(backgroundImage: NetworkImage(() {
                    final Faker faker = Faker();
                    return faker.image.image(keywords: [
                      'account',
                      'male',
                    ], random: true);
                  }())),
                  label: Text(() {
                    final Faker faker = Faker();
                    return faker.person.name();
                  }()),
                ),
                Chip(
                  avatar: CircleAvatar(backgroundImage: NetworkImage(() {
                    final Faker faker = Faker();
                    print('${faker.date.month()} / ${faker.date.year()}');
                    return faker.image.image(keywords: [
                      'account',
                      'male',
                    ], random: true);
                  }())),
                  label: Text(() {
                    final Faker faker = Faker();
                    return faker.person.name();
                  }()),
                ),
                Chip(
                  avatar: CircleAvatar(backgroundImage: NetworkImage(() {
                    final Faker faker = Faker();
                    return faker.image.image(keywords: [
                      'account',
                      'male',
                    ], random: true);
                  }())),
                  label: Text(() {
                    final Faker faker = Faker();
                    return faker.person.name();
                  }()),
                ),
                Chip(
                  avatar: CircleAvatar(backgroundImage: NetworkImage(() {
                    final Faker faker = Faker();
                    return faker.image.image(keywords: [
                      'account',
                      'male',
                    ], random: true);
                  }())),
                  label: Text(() {
                    final Faker faker = Faker();
                    return faker.person.name();
                  }()),
                ),
                Chip(
                  avatar: CircleAvatar(backgroundImage: NetworkImage(() {
                    final Faker faker = Faker();
                    return faker.image.image(keywords: [
                      'account',
                      'male',
                    ], random: true);
                  }())),
                  label: Text(() {
                    final Faker faker = Faker();
                    return faker.person.name();
                  }()),
                ),
              ],
            )),
            const SizedBox(height: 5.0),
            ////
            () {
              var random = Random(); // Use Random() for general purposes
              int minYear = 2010;
              int maxYear = 2023;
              int randomYear = minYear + random.nextInt(maxYear - minYear + 1);
              // print("Random integer: $randomYear");
              int minMonth = 1;
              int maxMonth = 12;
              int randomMonth = minMonth + random.nextInt(maxMonth - minMonth + 1);
              return Container(padding: const EdgeInsets.fromLTRB(20, 5, 50, 5), child: Text('$randomMonth - $randomYear'));
            }()

            ////
          ],
        ),
      ],
    );
  }
}
