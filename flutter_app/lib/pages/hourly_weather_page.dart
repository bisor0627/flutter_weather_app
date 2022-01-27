import 'package:flutter/material.dart';
import 'package:flutter_app/design/colors.dart';
import 'package:flutter_app/design/textstyles.dart';
import 'package:flutter_app/model/weather.dart';
import 'package:flutter_app/util.dart';
import 'package:flutter_app/widgets/default_box1.dart';
import 'package:intl/intl.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({Key? key, required this.hourly}) : super(key: key);
  final List<Hour> hourly;

  List<Widget> getListWidget(List<Hour> hourly) {
    List<Widget> weather = [];
    int count = 0;
    for (Hour map in hourly) {
      weather.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: DefaultBox1(
          height: 80,
          width: 166,
          color: count == 0 ? null : whiteA700,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              getWeatherWidget(map.weather!, height: 60, width: 60),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('dd일 kka').format(getTime(map.dt!)),
                      style: title2.override(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: count == 0 ? null : black_900),
                    ),
                    Text(
                      "${map.temp.toString()} c",
                      style: title2.override(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: count == 0 ? null : black_900),
                    )
                  ],
                ),
              ),
            ],
          ),
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
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: getListWidget(hourly),
        ),
      ),
    );
  }
}
