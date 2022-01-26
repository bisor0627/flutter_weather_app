import 'package:flutter/material.dart';
import 'package:flutter_app/model/weather.dart';
import 'package:flutter_app/util.dart';
import 'package:intl/intl.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({Key? key, required this.hourly}) : super(key: key);
  final List<Hour> hourly;

  List<Widget> getListWidget(List<Hour> hourly) {
    List<Widget> weather = [];
    int count = 0;
    for (Hour map in hourly) {
      weather.add(Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text(getWeather(map.weather!)),
            Column(
              children: [
                Text(DateFormat('dd일 kka').format(getTime(map.dt!))),
                Text(map.temp.toString())
              ],
            ),
          ],
        ),
      ));
      count++;
    }
    // print(count); 현재 + 48시간
    return weather;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: getListWidget(hourly),
      ),
    );
  }
}
