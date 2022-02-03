import 'package:flutter/material.dart';
import 'package:flutter_app/design/textstyles.dart';
import 'package:flutter_app/providers/weather_data.dart';
import 'package:flutter_app/util.dart';
import 'package:flutter_app/widgets/daily_weather.dart';
import 'package:flutter_app/widgets/hourly_weather.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DailyPage extends StatelessWidget {
  DailyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherData>(context);
    if (isPortrait(context)) {
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
            HourlyWeatherWidget(),
            MiniTitle(title: "Next Forecast"),
            DailyWeatherWidget()
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            MiniTitle(
                title:
                    "${DateFormat.MMMMd().format(getTime(weatherData.weather.current!.dt!))}"),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.89,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MiniTitle(title: "Today"),
                  MiniTitle(title: "Next Forecast"),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: HourlyWeatherWidget(
                      setPortrait: false,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: DailyWeatherWidget(setPortrait: isPortrait(context)),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}

class MiniTitle extends StatelessWidget {
  const MiniTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      textAlign: TextAlign.left,
      style: title3.override(fontSize: 18, fontWeight: FontWeight.w200),
    );
  }
}
