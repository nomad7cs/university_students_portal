import 'package:flutter/material.dart';
import 'package:univ_port_app/app_redux/actions.dart';

import '../globals.dart' as globals;

class ServiceCard extends StatelessWidget {
  final String title;
  final String translation;
  final String price;

  const ServiceCard({super.key, required this.title, required this.translation, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      width: MediaQuery.of(context).size.width > 300 ? 300 : 200,
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(7),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                // leading: Icon(Icons.album),
                // title: Text('The Enchanted Nightingale'),
                title: Text(title),
                subtitle: Text(translation),
              ),
              const Divider(
                thickness: 0.5,
                indent: 20.0,
                endIndent: 20.0,
                color: Colors.grey,
              ),
              const SizedBox(height: 15),
              // Container(
              //   child: Text(widget.price),
              // ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('سعر الخدمة'),
                  Text(price),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width < 350 ? 100 : 150,
                    child: FilledButton(
                        onPressed: () {
                          globals.reduxStore.dispatch(NavigateToUrlAction('/request_paper'));
                        },
                        child: const Text('Request')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
