import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StudentListCard extends StatefulWidget {
  final dynamic user;
  const StudentListCard({super.key, required this.user});

  // modifyUser(newValue) {
  //   user['displayName'] = newValue;
  // }

  @override
  State<StudentListCard> createState() => _StudentListCardState();
}

class _StudentListCardState extends State<StudentListCard> {
  final Faker faker = Faker();
  late String randomProfileImageURL = faker.image.image(keywords: ['account', 'male', 'avatar'], random: true);
  final _formKey = GlobalKey<FormState>();
  bool _editState = false;
  String? _nameField;
  int? _hoursField;
  dynamic _user;

  @override
  Widget build(BuildContext context) {
    print('-------------------------------------------------------widget.user["displayName"] ${widget.user['displayName']}');
    print('---------------------------------------------------------widget.user.reference.path ${widget.user.reference.path}');
    _user = null;
    // return Placeholder();
    _user = FirebaseFirestore.instance.doc(widget.user.reference.path).get();
    return FutureBuilder(
        future: _user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data != null) {
              final DocumentSnapshot document = snapshot.data! as DocumentSnapshot;
              _nameField = document['displayName'].toString();
              _hoursField = document['totalEarnedHours'];

              if (!_editState) {
                return Card(
                  child: ListTile(
                    title: Text('Name: ${document != null ? document['displayName'].toString() : ''}'),
                    subtitle: Text(
                        'Total Earned Hours: ${document != null ? document['totalEarnedHours'].toString() : ''} \n ${document != null ? document['email'] : ''}'),
                    leading: CircleAvatar(backgroundImage: NetworkImage(randomProfileImageURL)),
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
              } else {
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
                                initialValue: document != null ? document['displayName'].toString() : '',
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
                                  _nameField = value;
                                },
                              ),
                            ),
                            Flexible(
                                child: TextFormField(
                              initialValue: document != null ? document['totalEarnedHours'].toString() : '',
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
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
                                _hoursField = int.parse(value);
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
                            FirebaseFirestore.instance
                                .doc(widget.user.reference.path)
                                .update({'displayName': _nameField, 'totalEarnedHours': _hoursField});
                            _user = FirebaseFirestore.instance.doc(widget.user.reference.path).get();
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
              }
            } else {
              return const Text('Unknown error');
            }
          } else {
            return const Text('Unknown error');
          }
        });
  }
}

class TeacherListCard extends StatefulWidget {
  final dynamic user;
  const TeacherListCard({super.key, required this.user});

  @override
  State<TeacherListCard> createState() => _TeacherListCardState();
}

class _TeacherListCardState extends State<TeacherListCard> {
  final Faker faker = Faker();
  late String randomProfileImageURL = faker.image.image(keywords: ['account', 'male', 'avatar'], random: true);
  final _formKey = GlobalKey<FormState>();
  late List<TextEditingController> _controllers = [];
  final _fixedEmailFieldController = TextEditingController(); // Controller for fixed email field
  bool _editState = false;
  String? _nameField;
  int? _hoursField;
  dynamic _user;

  @override
  void initState() {
    super.initState();
    _controllers.add(TextEditingController()); // Start with one field
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _fixedEmailFieldController.dispose(); // Dispose of fixed field controller

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('-------------------------------------------------------widget.user["displayName"] ${widget.user['displayName']}');
    print('---------------------------------------------------------widget.user.reference.path ${widget.user.reference.path}');
    _user = null;
    // return Placeholder();
    _user = FirebaseFirestore.instance.doc(widget.user.reference.path).get();
    return FutureBuilder(
        future: _user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data != null) {
              final DocumentSnapshot document = snapshot.data! as DocumentSnapshot;
              _nameField = document['displayName'].toString();
              var _coursesFromFirestore = document['courses'] as List<dynamic>;
              //_hoursField = 0; //document['totalEarnedHours'];

              if (!_editState) {
                _fixedEmailFieldController.text = document['email'] ?? '';

                return Card(
                  child: ListTile(
                    title: Text('Name: ${document != null ? document['displayName'].toString() : ''}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${document != null ? document['email'] : ''}'),
                        Wrap(
                          spacing: 5.0,
                          children: [
                            ...() {
                              var courses = document['courses'] as List<dynamic>;
                              return [...courses.map((e) => Chip(label: Text(e.toString())))];
                            }(),
                          ],
                        ),
                      ],
                    ),
                    leading: CircleAvatar(backgroundImage: NetworkImage(randomProfileImageURL)),
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
              } else {
                /////////////////////// add
                // var courses = document['courses'] as List<dynamic>;
                // return [...courses.map((e) => Chip(label: Text(e.toString())))];
                _controllers = () {
                  return document['courses'] as List<dynamic>;
                }()
                    .map((course) => TextEditingController(text: course.toString()))
                    .toList();
                // TextEditingController(text: ''
                //   text: () {
                // try {
                //   return document['courses'] as List<dynamic>;
                // } catch (e) {
                //   return [''];
                // }
                // }()
                // .toString()
                // );
                return Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Fixed text field
                      TextFormField(
                        controller: _fixedEmailFieldController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      // Display existing fields
                      ..._controllers.mapIndexed((index, controller) {
                        return TextFormField(
                          // initialValue: () {
                          //   try {
                          //     return _coursesFromFirestore[index].toString();
                          //   } catch (error) {
                          //     return '';
                          //   }
                          // }(),
                          controller: controller,
                          decoration: InputDecoration(
                            labelText: 'Course ${index + 1}',
                            border: const OutlineInputBorder(),
                          ),
                        );
                      }),

                      Flexible(
                          child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _controllers.add(TextEditingController());
                              });
                            },
                            child: const Text('Add course'),
                          ),

                          const SizedBox(width: 5.0),

                          // Remove button (only visible if there's more than one field)
                          if (_controllers.length > 1)
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _controllers.removeLast();
                                });
                              },
                              child: const Text('Remove course'),
                            ),

                          const SizedBox(width: 5.0),

                          // Submit button
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                // Process form data (_controllers.map((c) => c.text).toList())
                                List<String> formData = _controllers.map((c) => c.text).toList();
                                print('Form data: ${_controllers.map((c) => c.text).toList()}');

                                try {
                                  await FirebaseFirestore.instance.doc(widget.user.reference.path).update({
                                    'email': _fixedEmailFieldController.text,
                                    // 'displayName': state.credential.user!.displayName ?? '',
                                    // 'courses': FieldValue.arrayUnion(formData),
                                    'courses': formData,
                                  });
                                } catch (error) {
                                  print('Error updating Firestore document: $error');
                                  // Handle error (e.g., show an error message)
                                }
                                setState(() {
                                  _editState = false;
                                });
                              }
                            },
                            child: const Text('Submit'),
                          ),

                          const SizedBox(width: 5.0),

                          IconButton(
                            onPressed: () {
                              setState(() {
                                _editState = false;
                              });
                            },
                            icon: const Icon(Icons.cancel),
                          ),
                        ],
                      )),
                      // Add button
                    ],
                  ),
                );
                /////////////////////// remove next
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
                                initialValue: document != null ? document['displayName'].toString() : '',
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
                                  _nameField = value;
                                },
                              ),
                            ),
                            Flexible(
                                child: TextFormField(
                              initialValue: '',
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
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
                            FirebaseFirestore.instance.doc(widget.user.reference.path).update({'displayName': _nameField});
                            _user = FirebaseFirestore.instance.doc(widget.user.reference.path).get();
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
              }
            } else {
              return const Text('Unknown error');
            }
          } else {
            return const Text('Unknown error');
          }
        });
  }
}

/*
  @override
  Widget build(BuildContext context) {
    _nameField ??= _user != null ? _user.data()['displayName'].toString() : '';
    _hoursField ??= _user != null ? _user.data()['totalEarnedHours'] : 0;
    // String fullName;
    // bool isStudent;
    // int earnedHours;
    // try {
    //   fullName = widget.user['displayName'];
    // } catch (e) {
    //   fullName = '';
    // }
    // try {
    //   isStudent = widget.user['isStudent'];
    // } catch (e) {
    //   isStudent = true;
    // }
    // try {
    //   earnedHours = widget.user['totalEarnedHours'];
    // } catch (e) {
    //   earnedHours = 0;
    // }

    Faker faker = Faker();
    String getRandomImageURL = faker.image.image(keywords: ['account', 'male', 'avatar'], random: true);
    if (!_editState) {
      return Card(
        child: ListTile(
          title: Text('Name: ${_user == null ? _user.data()['displayName'].toString() : ''}'),
          subtitle: Text(
              'Total Earned Hours: ${_user == null ? _user.data()['totalEarnedHours'].toString() : ''} \n ${_user == null ? _user.data()['email'] : ''}'),
          leading: CircleAvatar(backgroundImage: NetworkImage(getRandomImageURL)),
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
    } else {
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
                      initialValue: _user == null ? _user.data()['displayName'].toString() : '',
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
                        _nameField = value;
                      },
                    ),
                  ),
                  Flexible(
                      child: TextFormField(
                    initialValue: _user == null ? _user.data()['totalEarnedHours'].toString() : '',
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
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
                      _hoursField = int.parse(value);
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
                  FirebaseFirestore.instance
                      .doc(_user.path)
                      .update({'displayName': _nameField, 'totalEarnedHours': _hoursField});
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
    }
  }
}

* */
