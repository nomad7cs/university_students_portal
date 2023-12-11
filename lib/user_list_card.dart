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

  // late StreamSubscription _subscription;
  // String? _username = globals.reduxStore.state.username;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   // globals.reduxStore.dispatch(FetchExtraUserInfoAction(uid: globals.reduxStore.state.user!.firebaseUser.uid));
  //   _subscription = globals.reduxStore.onChange.listen((event) {
  //     setState(() {
  //       if (event.username == null) {
  //         _username = event.user?.firebaseUser.displayName;
  //       } else {
  //         _username = event.username;
  //       }
  //     });
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   _subscription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    if (_nameField == null) {
      _nameField = widget.user['displayName'].toString();
    }
    if (_hoursField == null) {
      _hoursField = widget.user['totalEarnedHours'];
    }
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
          title: Text('Name: ${widget.user['displayName'].toString()}'),
          subtitle: Text('Total Earned Hours: ${widget.user['totalEarnedHours'].toString()} \n ${widget.user['email']}'),
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
                      initialValue: widget.user['displayName'].toString(),
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
                    initialValue: widget.user['totalEarnedHours'].toString(),
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
                      .collection('users')
                      .doc(widget.user.id)
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
