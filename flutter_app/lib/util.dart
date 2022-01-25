import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

printJson(Map<String, dynamic> data) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(data);
  print(prettyprint);
}

DateTime getTime(int unixEpoch) {
  return DateTime.fromMillisecondsSinceEpoch(unixEpoch * 1000);
}

String getWeather(List weatherList) {
  String weather = "";
  for (Map weatherMap in weatherList) {
    weather = weatherMap['main'];
  }
  return weather;
}
