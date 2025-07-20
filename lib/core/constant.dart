import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/helpers/date_format.dart';
import 'package:store_app/core/theming/colors.dart';


import 'theming/assets.dart';

/// <------------------------ ONBOARDING CONSTANTS ------------------------->

List<Color> onboardingPagesColors = [
  const Color(0xFFFFB737),
  const Color(0xFF7667F6),
  const Color(0xFFFF6000),
  const Color(0xFF7667F6),
];

void printLargeText(String text) {
  const int chunkSize = 800; // Adjust this size based on your needs
  int start = 0;
  while (start < text.length) {
    int end =
        (start + chunkSize < text.length) ? start + chunkSize : text.length;
    printDebug(text.substring(start, end));
    start = end;
  }
}

void printDebug(dynamic text) {
  if (kDebugMode) {
    print(text.toString());
  }
}


String formatMessagesDate(DateTime date, BuildContext context) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final difference =
      today.difference(DateTime(date.year, date.month, date.day)).inDays;

  if (difference == 0) {
    return "Today";
  } else if (difference == 1) {
    return "Yesterday";
  } else {
    return CustomDateFormat.weekDayDayMonth(
        theTime: date.toString(), context: context);
  }
}
