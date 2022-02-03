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
  HourlyWeatherWidget({Key? key, this.setPortrait = true}) : super(key: key);
  final bool setPortrait;
  int count = 0;
  List<Widget> getListWidget(List<Hour> hourly, BuildContext context) {
    List<Widget> weather = [];

    for (Hour map in hourly) {
      weather.add(Padding(
        padding: setPortrait
            ? const EdgeInsets.only(right: 12.0, bottom: 8)
            : const EdgeInsets.only(bottom: 12.0, left: 4, right: 4),
        child: DefaultBox1(
          height: setPortrait
              ? MediaQuery.of(context).size.height * 0.1
              : MediaQuery.of(context).size.height * 0.15,
          width: setPortrait
              ? MediaQuery.of(context).size.width * 0.42
              : MediaQuery.of(context).size.height * 0.45,
          color: count == 0 ? null : Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              getWeatherWidget(map.weather!,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.height * 0.06,
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
                          color: count == 0 ? null : Colors.black),
                    ),
                    Text(
                      "${map.temp.toString()} c",
                      style: title2.override(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: count == 0 ? null : Colors.black),
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
    if (setPortrait) {
      return ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: getListWidget(weatherData.weather.hourly!, context),
      );
    } else {
      return ListView(
        shrinkWrap: true,
        children: getListWidget(weatherData.weather.hourly!, context),
      );
    }
  }
}
