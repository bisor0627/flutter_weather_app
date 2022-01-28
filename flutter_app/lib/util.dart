import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/design/colors.dart';
import 'package:flutter_app/model/models.dart';
import 'package:flutter_svg/svg.dart';

printJson(Map<String, dynamic> data) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(data);
  print(prettyprint);
}

DateTime getTime(num unixEpoch) {
  return DateTime.fromMillisecondsSinceEpoch((unixEpoch as int) * 1000);
}

Widget getWeatherWidget(WeatherID weatherID,
    {required double height,
    required double width,
    bool? lightBackground = false}) {
  String weather = "";
  Widget result;
  result = SvgPicture.asset(
    "assets/images/${weatherID.icon!}.svg",
    color: lightBackground == false ? Colors.white : indigo_400,
    height: height,
    width: width,
    fit: BoxFit.cover,
  );
  return result;
}
