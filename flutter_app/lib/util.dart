import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/design/image_const.dart';
import 'package:flutter_app/design/textstyles.dart';
import 'package:flutter_app/model/models.dart';

printJson(Map<String, dynamic> data) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(data);
  print(prettyprint);
}

DateTime getTime(int unixEpoch) {
  return DateTime.fromMillisecondsSinceEpoch(unixEpoch * 1000);
}

Widget getWeatherWidget(WeatherID weatherID,
    {required double height, required double width}) {
  String weather = "";
  Widget result;
  weather = weatherID.main!;
  switch (weather) {
    case "Clouds":
      result = Image.asset(
        img_mooncloudmid,
        height: height,
        width: width,
        fit: BoxFit.cover,
      );
      break;

    default:
      result = Text(
        weather,
        textAlign: TextAlign.center,
        style: title3,
      );
  }
  return result;
}
