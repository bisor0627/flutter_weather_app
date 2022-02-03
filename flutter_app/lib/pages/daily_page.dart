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
      return Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.17,
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
                  height: constraints.maxHeight * 0.12,
                  child: HourlyWeatherWidget()),
              MiniTitle(title: "Next Forecast"),
              Expanded(child: DailyWeatherWidget())
            ],
          );
        }),
      );
    } else {
      return Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.17,
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
                  width: constraints.maxWidth * 0.89,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MiniTitle(title: "Today"),
                      MiniTitle(title: "Next Forecast"),
                    ],
                  ),
                ),
                SizedBox(
                  width: constraints.maxWidth * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Expanded(
                      //     child: HourlyWeatherWidget(
                      //   setPortrait: false,
                      // )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: DailyWeatherWidget(
                              setPortrait: isPortrait(context))),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      );
    }
  }
}
