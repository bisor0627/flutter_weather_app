import 'package:flutter/material.dart';
import 'package:flutter_app/design/textstyles.dart';
import 'package:flutter_app/model/day.dart';
import 'package:flutter_app/providers/weather_data.dart';
import 'package:flutter_app/util.dart';
import 'package:flutter_app/widgets/default_box1.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget({
    Key? key,
    this.setPortrait = true,
  }) : super(key: key);
  final bool setPortrait;
  List<Widget> getListWidget(List<Day> daily, BuildContext context) {
    List<Widget> weather = [];
    int count = 0;
    for (Day map in daily) {
      if (count != 0) {
        weather.add(Padding(
          padding: const EdgeInsets.only(bottom: 12.0, left: 4, right: 4),
          child: DefaultBox1(
            height: 74,
            width: setPortrait
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
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
                  ),
                  Text(
                    "${map.temp!.day?.toStringAsFixed(1)} c",
                    style: title1,
                  ),
                  getWeatherWidget(map.weather!,
                      width: MediaQuery.of(context).size.height * 0.06,
                      height: MediaQuery.of(context).size.height * 0.06,
                      lightBackground: true),
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
    final weatherData = Provider.of<WeatherData>(context);

    if (setPortrait) {
      return ListView(
        children: getListWidget(weatherData.weather.daily!, context),
      );
    } else {
      return ListView(
        children: getListWidget(weatherData.weather.daily!, context),
      );
    }
  }
}
