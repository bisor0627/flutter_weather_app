import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/design/colors.dart';
import 'package:flutter_app/design/textstyles.dart';
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
    color: lightBackground == false ? Colors.white : Colors.black,
    height: height,
    width: width,
    fit: BoxFit.cover,
  );
  return result;
}

bool isPortrait(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.portrait;

class MiniTitle extends StatelessWidget {
  const MiniTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      textAlign: TextAlign.left,
      style: title3.override(fontSize: 18, fontWeight: FontWeight.w200),
    );
  }
}
