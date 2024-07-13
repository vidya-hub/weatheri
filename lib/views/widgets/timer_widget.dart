import 'package:flutter/material.dart';
import 'dart:async';

import 'package:weatheri/utils/extensions/date_time_extensions.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({super.key});

  @override
  TimeWidgetState createState() => TimeWidgetState();
}

class TimeWidgetState extends State<TimeWidget> {
  late Stream<DateTime> _timeStream;

  @override
  void initState() {
    super.initState();
    // Initialize the time stream with the method to fetch current time asynchronously
    _timeStream = _getTimeStream();
  }

  // Method to generate a stream of DateTime objects, updating every second
  Stream<DateTime> _getTimeStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: _timeStream,
      builder: (context, snapshot) {
        // Display the current time formatted using custom extension method if data is available,
        // otherwise, display default time "00:00:00"
        return Expanded(
          child: Center(
            child: Text(
              snapshot.hasData ? snapshot.data!.formattedTime : "00:00:00",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        );
      },
    );
  }
}
