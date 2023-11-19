import 'package:flutter/material.dart';
import 'package:univ_port_app/dashboard/upcomings.dart';

import 'app_drawer.dart';
import 'custom_appbar.dart';
import 'dashboard/dashboard_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(100),
      //   child: CustomAppBar(),
      // ),
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SafeArea(
        top: true,
        // child: SizedBox(
        // height: MediaQuery.of(context).size.height,// - AppBar().preferredSize.height,
        child: ListView(
          scrollDirection: Axis.vertical,
          // padding: const EdgeInsets.only(right: 15.0, left: 15.0),
          padding: const EdgeInsets.all(15.0),
          children: const [
            // DashboardDetails(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: DashboardDetails()),
                SizedBox(width: 15.0),
                Expanded(flex: 2, child: Upcomings()),
              ],
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
