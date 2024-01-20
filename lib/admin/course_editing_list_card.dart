import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:univ_port_app/models/courses.dart';

class CourseEditingListCard extends StatefulWidget {
  final Course course;
  const CourseEditingListCard({super.key, required this.course});

  @override
  State<CourseEditingListCard> createState() => _CourseEditingListCardState();
}

class _CourseEditingListCardState extends State<CourseEditingListCard> {
  bool _editState = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // return Text(course.fullName);
    if (_editState) {
      return Form(
        key: _formKey,
        child: Row(
          children: [
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: TextFormField(
                      initialValue: widget.course.fullName,
                      decoration: const InputDecoration(
                        // icon: Icon(Icons.person),
                        hintText: 'Your Full Name',
                        labelText: 'FullName *',
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        // globals.reduxStore.dispatch(SetUserNamePayloadAction(value));
                        // _nameField = value;
                      },
                    ),
                  ),
                  Flexible(
                      child: TextFormField(
                    // initialValue: document['totalEarnedHours'].toString(),
                    keyboardType: TextInputType.number,
                    // inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      hintText: 'Total Earned Hours',
                      labelText: 'Earned Hours: *',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter earned hours';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      // _hoursField = int.parse(value);
                      // globals.reduxStore.dispatch(SetEarnedHoursPayloadAction(int.parse(value)));
                    },
                  )),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  // globals.reduxStore.dispatch(SaveUserDataAction());
                  // FirebaseFirestore.instance.doc('/courses/${widget.course.id}').update({'code': _code, 'fullName': _fullName});
                  _editState = false;
                });
              },
              icon: const Icon(Icons.save),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _editState = false;
                });
              },
              icon: const Icon(Icons.cancel),
            ),
          ],
        ),
      );
    } else {
      return Card(
        elevation: 2.0,
        child: ListTile(
          title: Text('Course: ${widget.course.code} - ${widget.course.fullName}'),
          subtitle: Text('Dr. ${() {
            final Faker faker = Faker();
            return faker.person.name();
          }()}'),
          leading: SizedBox(
            height: 120.0,
            width: 120.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7.0),
              child: Image(
                image: NetworkImage(() {
                  final Faker faker = Faker();
                  return faker.image.image(keywords: ['computer', 'science', 'subject'], random: true);
                }()),
                fit: BoxFit.contain,
                // fit: BoxFit.none,
              ),
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                _editState = true;
              });
            },
            icon: const Icon(Icons.edit),
          ),
        ),
      );
    }
  }
}
