import 'package:flutter/material.dart';
import 'package:flutter_app/util.dart';
import 'package:intl/intl.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget(
      {Key? key,
      required this.unixtime,
      required this.temp,
      required this.timezone,
      required this.feelsLike,
      required this.humidity,
      required this.windSpeed,
      required this.weather})
      : super(key: key);
  final String timezone;
  final int unixtime;
  final double temp;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final List weather;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(timezone),
        Text(DateFormat.MMMEd().format(getTime(unixtime))),
        Text(getWeather(weather)),
        Text(temp.toString()),
        Text(feelsLike.toString()),
        Text(humidity.toString()),
        Text(windSpeed.toString())
      ]),
    );
  }
}
