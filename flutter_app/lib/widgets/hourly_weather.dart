import 'package:flutter/material.dart';
import 'package:flutter_app/design/colors.dart';
import 'package:flutter_app/design/textstyles.dart';
import 'package:flutter_app/model/hour.dart';
import 'package:flutter_app/providers/weather_data.dart';
import 'package:flutter_app/util.dart';
import 'package:flutter_app/widgets/default_box1.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HourlyWeatherWidget extends StatelessWidget {
  HourlyWeatherWidget({
    Key? key,
  }) : super(key: key);
  int count = 0;
  List<Widget> getListWidget(List<Hour> hourly) {
    List<Widget> weather = [];

    for (Hour map in hourly) {
      weather.add(Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: DefaultBox1(
          height: 80,
          width: 166,
          color: count == 0 ? null : whiteA700,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              getWeatherWidget(map.weather!,
                  height: 60,
                  width: 60,
                  lightBackground: count == 0 ? false : true),
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
    final weatherData = Provider.of<WeatherData>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 100,
        child: Row(
          children: getListWidget(weatherData.weather.hourly!),
        ),
      ),
    );
  }
}
