import 'package:flutter/material.dart';
import 'package:flutter_app/design/textstyles.dart';
import 'package:flutter_app/providers/weather_data.dart';
import 'package:flutter_app/util.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({
    Key? key,
    this.setPortrait = true,
  }) : super(key: key);
  final bool setPortrait;
  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherData>(context);
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              weatherData.weather.timezone!,
              textAlign: TextAlign.center,
              style: title1,
            ),
          ),
          Text(
              DateFormat.MMMMd()
                  .format(getTime(weatherData.weather.current!.dt!)),
              textAlign: TextAlign.center,
              style: title3),
        ],
      ),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: getWeatherWidget(weatherData.weather.current!.weather!,
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.height * 0.2),
          ),
          Text(weatherData.weather.current!.temp.toString() + " c",
              textAlign: TextAlign.center, style: mainTemp),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text("Temp", textAlign: TextAlign.center, style: title3),
                Text("${weatherData.weather.current!.feels_like.toString()} c",
                    textAlign: TextAlign.center, style: title2),
              ],
            ),
            Column(
              children: [
                Text("Humidy", textAlign: TextAlign.center, style: title3),
                Text(weatherData.weather.current!.humidity.toString(),
                    textAlign: TextAlign.center, style: title2),
              ],
            ),
            Column(
              children: [
                Text("Wind", textAlign: TextAlign.center, style: title3),
                Text(weatherData.weather.current!.wind_speed.toString(),
                    textAlign: TextAlign.center, style: title2),
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
