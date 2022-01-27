import 'package:flutter/material.dart';
import 'package:flutter_app/design/textstyles.dart';
import 'package:flutter_app/model/current.dart';
import 'package:flutter_app/util.dart';
import 'package:intl/intl.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({
    Key? key,
    required this.timezone,
    required this.current,
  }) : super(key: key);
  final String timezone;
  final Current current;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            timezone,
            textAlign: TextAlign.center,
            style: title1,
          ),
          Text(DateFormat.MMMMd().format(getTime(current.dt!)),
              textAlign: TextAlign.center, style: title3),
        ],
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: getWeatherWidget(current.weather!, height: 155, width: 155),
          ),
          Text(current.temp.toString() + " c",
              textAlign: TextAlign.center, style: mainTemp),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text("Temp", textAlign: TextAlign.center, style: title3),
                Text("${current.feels_like.toString()} c",
                    textAlign: TextAlign.center, style: title2),
              ],
            ),
            Column(
              children: [
                Text("Humidy", textAlign: TextAlign.center, style: title3),
                Text(current.humidity.toString(),
                    textAlign: TextAlign.center, style: title2),
              ],
            ),
            Column(
              children: [
                Text("Wind", textAlign: TextAlign.center, style: title3),
                Text(current.wind_speed.toString(),
                    textAlign: TextAlign.center, style: title2),
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
