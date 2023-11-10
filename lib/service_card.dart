import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  final String title;
  final String translation;
  final String price;

  const ServiceCard({super.key, required this.title, required this.translation, required this.price});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width > 300 ? 300 : 200,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(7),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                // leading: Icon(Icons.album),
                // title: Text('The Enchanted Nightingale'),
                title: Text(widget.title),
                subtitle: Text(widget.translation),
              ),
              Divider(
                thickness: 0.5,
                indent: 20.0,
                endIndent: 20.0,
                color: Colors.grey,
              ),
              SizedBox(height: 15),
              // Container(
              //   child: Text(widget.price),
              // ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    const Text('سعر الخدمة'),
                    Text(widget.price),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width < 350 ? 100 : 150,
                    child: FilledButton(onPressed: () {}, child: Text('Request')),
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
