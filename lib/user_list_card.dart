import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserListCard extends StatefulWidget {
  final dynamic user;
  const UserListCard({super.key, required this.user});

  // modifyUser(newValue) {
  //   user['displayName'] = newValue;
  // }

  @override
  State<UserListCard> createState() => _UserListCardState();
}

class _UserListCardState extends State<UserListCard> {
  final _formKey = GlobalKey<FormState>();
  bool _editState = false;
  String? _nameField;
  int? _hoursField;
  dynamic _user;

  // late StreamSubscription _subscription;
  // String? _username = globals.reduxStore.state.username;
  //
  @override
  void initState() {
    super.initState();
    _user = FirebaseFirestore.instance.doc(widget.user.reference.path).get();
  }
  //
  // @override
  // void dispose() {
  //   _subscription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    print('-------------------------------------------------------widget.user["displayName"] ${widget.user['displayName']}');
    print('---------------------------------------------------------widget.user.reference.path ${widget.user.reference.path}');
    // return Placeholder();
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
              Faker faker = Faker();
              String getRandomImageURL = faker.image.image(keywords: ['account', 'male', 'avatar'], random: true);
              if (!_editState) {
                return Card(
                  child: ListTile(
                    title: Text('Name: ${document != null ? document['displayName'].toString() : ''}'),
                    subtitle: Text(
                        'Total Earned Hours: ${document != null ? document['totalEarnedHours'].toString() : ''} \n ${document != null ? document['email'] : ''}'),
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
