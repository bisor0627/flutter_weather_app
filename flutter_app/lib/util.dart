import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/weather.dart';
import 'package:intl/intl.dart';

printJson(Map<String, dynamic> data) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(data);
  print(prettyprint);
}

DateTime getTime(int unixEpoch) {
  return DateTime.fromMillisecondsSinceEpoch(unixEpoch * 1000);
}

String getWeather(WeatherID weatherID) {
  String weather = "";
  weather = weatherID.main!;

  return weather;
}
