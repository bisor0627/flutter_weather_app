import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_call.dart';
import 'package:flutter_app/location/current_location.dart';
import 'package:flutter_app/theme/themedata_page.dart';
import 'package:flutter_app/util.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ThemeDataPage()));
              },
              child: Text("THEME DATA PAGE")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
              child: Text("WEATHER APP PAGE")),
        ],
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  TextEditingController locationSerchController = TextEditingController();
  APICallService apiCallService = APICallService();
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
                lat: CurrentLocation.location!.latitude!,
                long: CurrentLocation.location!.longitude!),
            builder: (context, snapshot) {
              var current = snapshot.data!['current'];
              if (snapshot.connectionState == ConnectionState.done) {
                print(current['weather']);
                return CurrentWeatherCard(
                  timezone: snapshot.data!['timezone'],
                  unixtime: current['dt'],
                  temp: current['temp'],
                  feelsLike: current['feels_like'],
                  humidity: current['humidity'],
                  windSpeed: current['wind_speed'],
                );
              }
              return Center(
                child: Text("loading..."),
              );
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

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({
    Key? key,
    required this.unixtime,
    required this.temp,
    required this.timezone,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
  }) : super(key: key);
  final String timezone;
  final int unixtime;
  final double temp;
  final double feelsLike;
  final int humidity;
  final double windSpeed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(getTime(unixtime)),
        Text(temp.toString()),
        Text(feelsLike.toString()),
        Text(humidity.toString()),
        Text(windSpeed.toString())
      ]),
    );
  }
}
