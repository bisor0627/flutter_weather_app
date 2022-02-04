import 'package:flutter/material.dart';
import 'package:flutter_app/design/textstyles.dart';
import 'package:flutter_app/providers/weather_data.dart';
import 'package:flutter_app/util.dart';
import 'package:flutter_app/widgets/daily_weather.dart';
import 'package:flutter_app/widgets/hourly_weather.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DailyPage extends StatelessWidget {
  DailyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherData>(context);
    if (isPortrait(context)) {
      return portraitWidget(weatherData, context);
    } else {
      return portraitWidget(weatherData, context);
    }
  }

  Scaffold portraitWidget(WeatherData weatherData, BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.17,
          child: Align(
            alignment: Alignment(0.0, 0.6),
            child: Text(
              "Forecast Report",
              style: title1,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MiniTitle(title: "Today"),
            MiniTitle(
                title:
                    "${DateFormat.MMMMd().format(getTime(weatherData.weather.current!.dt!))}"),
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
            child: HourlyWeatherWidget()),
        MiniTitle(title: "Next Forecast"),
        Expanded(child: DailyWeatherWidget())
      ],
    ));
  }
}
