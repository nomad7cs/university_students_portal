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
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(fit: FlexFit.loose, child: DashboardDetails()),
                SizedBox(height: 10.0),
                Flexible(fit: FlexFit.loose, child: Upcomings()),
              ],
            );
          } else {
            return const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(flex: 5, fit: FlexFit.loose, child: DashboardDetails()),
                SizedBox(width: 15.0),
                Flexible(flex: 2, fit: FlexFit.loose, child: Upcomings()),
              ],
            );
          }
        }()),
        // ),
      ),
    );
  }
}
