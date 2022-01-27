import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/design/textstyles.dart';
import 'package:flutter_app/model/weather.dart';
import 'package:flutter_app/design/image_const.dart';
import 'package:flutter_app/pages/main_page.dart';
import 'package:flutter_app/util/api_call.dart';
import 'package:flutter_app/util/current_location.dart';
import 'package:flutter_app/pages/current_weather_page.dart';
import 'package:flutter_app/pages/daily_weather_page.dart';
import 'package:flutter_app/pages/hourly_weather_page.dart';
import 'package:flutter_app/widgets/default_box1.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';

class DailyPage extends StatelessWidget {
  DailyPage({Key? key}) : super(key: key);

  Address address = Address();
  Weather weather = Weather();
  APICallService apiCallService = APICallService();
  CurrentLocation currentLocation = CurrentLocation();
  TextEditingController locationSerchController = TextEditingController();

  StreamController<Address> addressStreamController =
      StreamController.broadcast();
  StreamController<Weather> weatherStreamController =
      StreamController.broadcast();

  getCurrentAddress() async {
    this.address = await currentLocation.getLocation();
    weather =
        await apiCallService.makeAPICall(lat: address.lat!, lon: address.lon!);
    addressStreamController.add(address);
  }

  /// stream에 검색어를 넣고 api에서 Address(위도와 경도)를 얻음
  addressStreamer() async {
    List<Location> result;
    locationSerchController.addListener(() async {
      try {
        result = await locationFromAddress(locationSerchController.text.trim());
        address = Address.fromLocation(result.first);
        weather = await apiCallService.makeAPICall(
            lat: address.lat!, lon: address.lon!);
        addressStreamController.add(address);
      } catch (e) {
        print(e);
      }
    });
  }

  /// api에 Address(위도와 경도)를 넣고 stream에 Weather을 넣음

  @override
  Widget build(BuildContext context) {
    getCurrentAddress();
    addressStreamer();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            StreamBuilder<Address>(
              stream: addressStreamController.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Today",
                                  textAlign: TextAlign.left,
                                  style: title3.override(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w200),
                                ),
                                Text(
                                  "---- -- ----",
                                  textAlign: TextAlign.left,
                                  style: title3.override(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w200),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: HourlyWeatherWidget(hourly: weather.hourly!),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              "Next Forecast",
                              textAlign: TextAlign.left,
                              style: title3.override(
                                  fontSize: 18, fontWeight: FontWeight.w200),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: DailyWeatherWidget(daily: weather.daily!),
                          )
                        ],
                      )
                    ],
                  );
                }
                print("${snapshot.connectionState}");
                return Text("null");
              },
            ),
          ],
        ),
      ),
    );
  }

  void mapButtonAction() {
    getCurrentAddress();
    locationSerchController.text = "";
  }
}
