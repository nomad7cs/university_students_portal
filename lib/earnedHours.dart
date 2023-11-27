import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:univ_port_app/app_redux/actions.dart';

import 'globals.dart' as globals;

class SetEarnedHours extends StatefulWidget {
  const SetEarnedHours({super.key});

  @override
  State<SetEarnedHours> createState() => _SetEarnedHoursState();
}

class _SetEarnedHoursState extends State<SetEarnedHours> {
  late StreamSubscription _subscription;
  // int? _payload;
  int? _totalEarnedHours;

  @override
  void initState() {
    super.initState();
    _subscription = globals.reduxStore.onChange.listen((event) {
      _totalEarnedHours = event.totalEarnedHours ?? 0;
      // if (event.earnedHoursPayload == null) {
      //   _payload = event.totalEarnedHours;
      // } else {
      //   _payload = event.earnedHoursPayload;
      // }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Flexible(
          child: TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              labelText: 'Enter an integer',
            ),
            onChanged: (text) {
              int? parsedInt;
              if (text.isNotEmpty) {
                parsedInt = int.tryParse(text);

                // if (parsedInt != null) {
                //   print("\x1B[31mThe string $text can be converted to an integer: $parsedInt\x1B[0m");
                // } else {
                //   print("\x1B[31mThe string $text cannot be converted to an integer\x1B[0m");
                // }
                globals.reduxStore.dispatch(SetEarnedHoursPayloadAction(parsedInt));
                // _payload = parsedInt;
              } else {
                if (globals.reduxStore.state.totalEarnedHours == null) {
                  globals.reduxStore.dispatch(SetEarnedHoursPayloadAction(null));
                } else {
                  globals.reduxStore.dispatch(SetEarnedHoursPayloadAction(globals.reduxStore.state.totalEarnedHours));
                }
                // _payload = null;
              }
            },
            // validator: (value) {
            //   value.isNotEmpty;
            //   return null;
            // },
          ),
        ),
        Text('Total Earned Hours: ${_totalEarnedHours ?? ""}'),
        const Spacer(),
      ],
    );
  }
}
