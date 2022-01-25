import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/api_call.dart';
import 'package:flutter_app/util/current_location.dart';
import 'package:flutter_app/util/location_permission.dart';
import 'package:flutter_app/pages/current_weather_page.dart';
import 'package:flutter_app/pages/daily_page.dart';
import 'package:flutter_app/pages/daily_weather_page.dart';
import 'package:flutter_app/pages/hourly_weather_page.dart';
import 'package:flutter_app/theme/themedata_page.dart';

import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';

// Todo! 전역 location data -> mainPage에서만 사용하기
// Todo! Permission -> main.dart로 이사하기
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Map<String, dynamic> weatherData = {};
  late TabController controller;
  // var getData;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [MainPage(), DailyPage(), ThemeDataPage()],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        // indicatorWeight:
        labelColor: Colors.blue,
        tabs: const [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
              size: 20,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.red,
              size: 20,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.looks_3,
              color: Colors.red,
              size: 20,
            ),
          )
        ],
        controller: controller,
      ),
    );
  }
}

class MainPage extends WeatherApiMap {
  MainPage({Key? key}) : super(key: key);
  TextEditingController locationSerchController = TextEditingController();
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
          LocationRow(controller: locationSerchController),
          FutureBuilder<Map<String, dynamic>>(
            future: apiCallService.makeAPICall(
                futurelocationData: currentLocation.getLocation()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                weatherMap = snapshot.data!;
                var current = snapshot.data!['current'];
                List hourly = snapshot.data!['hourly'];
                List daily = snapshot.data!['daily'];
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      CurrentWeatherWidget(
                        timezone: snapshot.data!['timezone'],
                        weather: current['weather'],
                        unixtime: current['dt'],
                        temp: current['temp'],
                        feelsLike: current['feels_like'],
                        humidity: current['humidity'],
                        windSpeed: current['wind_speed'],
                      ),
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

class LocationRow extends StatelessWidget {
  LocationRow({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        children: [
          Flexible(
            flex: 8,
            child: SizedBox(
              height: 40,
              child: TextFormField(
                controller: controller,
                textInputAction: TextInputAction.go,
                onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                    labelText: "Search", //'Details'
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: ElevatedButton(
                child: Icon(
                  CupertinoIcons.map_pin_ellipse,
                ),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}

class WeatherApiMap extends StatelessWidget {
  WeatherApiMap({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Map<String, dynamic> _weatherMap = {};

  Map<String, dynamic> get weatherMap => _weatherMap;

  set weatherMap(Map<String, dynamic> weatherMap) {
    _weatherMap = weatherMap;
    print(_weatherMap);
  }
}
