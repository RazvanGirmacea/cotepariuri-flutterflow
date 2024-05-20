import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String unixToTime(int unixTimestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
  String formattedTime =
      "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  return formattedTime;
}

String convertDateFormat(String date) {
  // Parse the date
  DateTime parsedDate = DateTime.parse(date);

  // Use DateFormat to format the parsed date
  return DateFormat('d MMM. y').format(parsedDate).toUpperCase();
}

String? hideNullValue(String? oddInput) {
  if (oddInput == "null") {
    return "-";
  } else {
    return oddInput;
  }
}

String toUpper(String text) {
  String uppercaseString = text.toUpperCase();
  return uppercaseString;
}

bool flipFlag(bool flag) {
  return !flag;
}

String unixToDate(int unixTimestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
  DateFormat formatter = DateFormat("dd MMM. yyyy");
  String formattedDate = formatter.format(dateTime);

  return formattedDate.toUpperCase();
}

String jsonToString(dynamic jsonInput) {
  return jsonEncode(jsonInput);
}

dynamic statschange(String state) {
  Map<String, dynamic> parsedJson = jsonDecode(state);

  // Transform to the desired format by extracting just the inner values
  List<Map<String, dynamic>> transformedList = parsedJson.values
      .map((value) => Map<String, dynamic>.from(value))
      .toList();

  // Wrap in a new map
  Map<String, dynamic> result = {"stats": transformedList};

  // (Optional) Convert back to JSON
  return result;
}
