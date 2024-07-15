import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeDemo extends StatefulWidget {
  const TimeDemo({super.key});

  @override
  State<TimeDemo> createState() => _TimeDemoState();
}

class _TimeDemoState extends State<TimeDemo> {

  @override
  Widget build(BuildContext context) {
    bool is24HoursFormat = MediaQuery.of(context).alwaysUse24HourFormat;
    print('is24HoursFormat: $is24HoursFormat');
    print(DateTime.now());
    String timeFormat1 = DateFormat().format(DateTime.now());
    print('timeFormat1: $timeFormat1');
    // a display AM/PM
    print(DateFormat('M/dd hh:mm a').format(DateTime.now()));
    print(DateFormat('hh:mm a').format(DateTime.now()));

    print('DateFormat.j()');
    print(DateFormat.j().format(DateTime.now()));
    print(DateFormat.jm().format(DateTime.now()));
    print(DateFormat.jms().format(DateTime.now()));
    print(DateFormat.jmv().format(DateTime.now()));
    print(DateFormat.jmz().format(DateTime.now()));
    print(DateFormat.jv().format(DateTime.now()));
    print(DateFormat.jz().format(DateTime.now()));
    print(DateFormat.Hm().format(DateTime.now()));
    print(DateFormat.Md().add_jm().format(DateTime.now()));
    print(DateFormat.MMMd().add_jm().format(DateTime.now()));
    print(DateFormat.MMMMd().add_jm().format(DateTime.now()));
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Demo'),
      ),
      body: Text(DateFormat('M/dd hh:mm a').format(DateTime.now())),
    );
  }
}
