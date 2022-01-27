import 'package:flutter/material.dart';
import 'package:flutter_app/design/textstyles.dart';
import 'package:flutter_app/model/day.dart';
import 'package:flutter_app/model/weather.dart';
import 'package:flutter_app/util.dart';
import 'package:flutter_app/widgets/default_box1.dart';
import 'package:intl/intl.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget({Key? key, required this.daily}) : super(key: key);
  final List<Day> daily;

  List<Widget> getListWidget(List<Day> daily, BuildContext context) {
    List<Widget> weather = [];
    int count = 0;
    for (Day map in daily) {
      if (count != 0) {
        weather.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultBox1(
            height: 74,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat.EEEE().format(getTime(map.dt!)),
                        style: title2,
                      ),
                      Text(
                        DateFormat.MMMd().format(getTime(map.dt!)),
                        style: title3,
                      ),
                    ],
                  ),
                  Text(
                    "${map.temp!.day?.toStringAsFixed(1)} c",
                    style: title1,
                  ),
                  getWeatherWidget(map.weather!, width: 60, height: 60),
                ],
              ),
            ),
          ),
        ));
      }

      count++;
    }
    // print(count); 현재 + 48시간
    return weather;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: getListWidget(daily, context),
    );
  }
}
