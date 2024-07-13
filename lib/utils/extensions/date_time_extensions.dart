import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  Color get getColorForTime {
    if (hour >= 6 && hour < 12) {
      // Morning colors
      return Colors.orange.withOpacity(0.1);
    } else if (hour >= 12 && hour < 17) {
      // Afternoon colors
      return Colors.blue.withOpacity(0.1);
    } else if (hour >= 17 && hour < 20) {
      // Evening colors
      return Colors.red.withOpacity(0.1);
    } else if (hour >= 20 || hour < 6) {
      // Night colors
      return Colors.indigo.withOpacity(0.1);
    } else {
      // Default or midnight colors
      return Colors.grey.withOpacity(0.1);
    }
  }

  String get formattedTime {
    return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}";
  }

  String get formattedDay {
    return DateFormat('EEEE').format(this);
  }
}
