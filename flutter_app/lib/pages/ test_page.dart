import 'package:flutter/material.dart';
import 'package:flutter_app/design/textstyles.dart';
import 'package:flutter_app/model/address.dart';
import 'package:flutter_app/providers/weather_data.dart';
import 'package:flutter_app/util/current_location.dart';
import 'package:flutter_app/widgets/current_weather.dart';
import 'package:flutter_app/widgets/hourly_weather.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WeatherData>(
      create: (_) => WeatherData(),
      child: Example(),
    );
  }
}

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: CurrentWeatherWidget(
            timezone: context.watch<WeatherData>().weather.timezone ?? "",
            current: context.watch<WeatherData>().weather.current!,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
                  child: Text(
                    "Today",
                    textAlign: TextAlign.left,
                    style: title3.override(
                        fontSize: 18, fontWeight: FontWeight.w200),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: HourlyWeatherWidget(
                      hourly: context.watch<WeatherData>().weather.hourly!),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

/*
 onPressed: () async {
            CurrentLocation currentLocation = CurrentLocation();
            Address address;
            address = await currentLocation.getLocation();
            context.read<WeatherData>().setWeatherFromAddress(address);
          },

                  



 */