import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: AppBar(
        // leading: ,
        toolbarHeight: 100.0,
        backgroundColor: Color.fromARGB(255, 25, 47, 89),
        foregroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(
              width: 70.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.0),
                child: Image(
                  image: AssetImage('assets/img/must-logo.svg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text('clge'),
          ],
        ),
        elevation: 4,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white), // Icons.notification_important
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
    );
  }
}
