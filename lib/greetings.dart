import 'package:flutter/material.dart';

class DashboardGreetings extends StatelessWidget {
  const DashboardGreetings({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    'Hello, Hossam',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                  ),
                  padding: EdgeInsets.only(left: 15),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    '2-10-2023',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey[700]),
                  ),
                ),
              ],
            )),
        Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 170,
                  height: 35,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.grey, width: 0.5),
                        ),
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search)),
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.notifications_none)
              ],
            )),
      ],
    );
  }
}
