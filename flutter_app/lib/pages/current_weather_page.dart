import 'package:flutter/material.dart';
import 'package:flutter_app/model/weather.dart';
import 'package:flutter_app/util.dart';
import 'package:intl/intl.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({
    Key? key,
    required this.unixtime,
    required this.timezone,
    required this.current,
  }) : super(key: key);
  final int unixtime;
  final String timezone;
  final Current current;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(timezone),
        Text(DateFormat.MMMEd().format(getTime(unixtime))),
        Text(getWeather(current.weather!)),
        Text(current.temp.toString()),
        Text(current.feels_like.toString()),
        Text(current.humidity.toString()),
        Text(current.wind_speed.toString())
      ]),
    );
  }
}
