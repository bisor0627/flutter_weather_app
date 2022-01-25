import 'package:flutter/material.dart';
import 'package:flutter_app/pages/current_weather_page.dart';
import 'package:flutter_app/pages/daily_weather_page.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/hourly_weather_page.dart';
import 'package:flutter_app/util/api_call.dart';
import 'package:flutter_app/util/current_location.dart';

class DailyPage extends StatelessWidget {
  DailyPage({Key? key}) : super(key: key);
  APICallService apiCallService = APICallService();
  CurrentLocation currentLocation = CurrentLocation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          FutureBuilder<Map<String, dynamic>>(
            future: apiCallService.makeAPICall(
                futurelocationData: currentLocation.getLocation()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List hourly = snapshot.data!['hourly'];
                List daily = snapshot.data!['daily'];
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      HourlyWeatherWidget(hourly: hourly),
                      DailyWeatherWidget(daily: daily)
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text("loading..."),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
