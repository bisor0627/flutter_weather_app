import 'package:flutter/material.dart';
import 'package:flutter_app/model/weather.dart';
import 'package:flutter_app/util.dart';
import 'package:intl/intl.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget({Key? key, required this.daily}) : super(key: key);
  final List<Day> daily;

  List<Widget> getListWidget(List<Day> daily) {
    List<Widget> weather = [];
    int count = 0;
    for (Day map in daily) {
      weather.add(Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text(getWeather(map.weather!)),
            Column(
              children: [
                Text(DateFormat('MM월 dd일').format(getTime(map.dt!))),
                Text(map.temp!.day.toString())
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
      scrollDirection: Axis.vertical,
      child: Column(
        children: getListWidget(daily),
      ),
    );
  }
}
