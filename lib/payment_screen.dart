import 'package:flutter/material.dart';
import 'package:univ_port_app/app_drawer.dart';
import 'package:univ_port_app/app_redux/actions.dart';
import 'package:univ_port_app/custom_appbar.dart';
import 'package:univ_port_app/globals.dart' as globals;

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _payed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SafeArea(
        top: true,
        child: () {
          if (_payed) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Icon(Icons.verified), Text('Payed Successfully!')],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('You can proceed to receive your paper(s).'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  FilledButton(
                    onPressed: () {
                      globals.reduxStore.dispatch(NavigateToUrlAction('/home'));
                    },
                    child: const Text('Close Request'),
                  ),
                ],
              ),
            );
          } else {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Flexible(
                      child: Image(
                        image: AssetImage('assets/img/card-image-debit-card.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                              child: TextFormField(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.credit_card), hintText: 'Card Number',

                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              filled: true,
                              // labelText: 'Card Number *',
                            ),
                            onSaved: (String? value) {
                              // This optional block of code can be used to run
                              // code when the user saves the form.
                            },
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            autofocus: true,
                          )),
                          const SizedBox(height: 10.0),
                          Flexible(
                              child: TextFormField(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.person),
                              hintText: 'Full Name',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              filled: true,
                            ),
                            onSaved: (String? value) {},
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          )),
                          const SizedBox(height: 10.0),
                          Flexible(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: TextFormField(
                                decoration: InputDecoration(
                                  icon: const Icon(Icons.calendar_today),
                                  hintText: 'MM/YY',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  filled: true,
                                ),
                                onSaved: (String? value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              )),
                              Flexible(
                                  child: TextFormField(
                                decoration: InputDecoration(
                                  icon: const Icon(Icons.lock),
                                  hintText: 'CVV',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  filled: true,
                                  // labelText: 'Card Number *',
                                ),
                                onSaved: (String? value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              )),
                            ],
                          )),
                          const SizedBox(height: 10.0),
                          ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Processing Data')),
                                );
                                // Perform the action after 1.2 seconds
                                Future.delayed(const Duration(milliseconds: 1200), () {
                                  setState(() {
                                    _payed = true;
                                  });
                                });
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }(),
      ),
    );
  }
}
