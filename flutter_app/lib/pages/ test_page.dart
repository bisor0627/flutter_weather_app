import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/design/colors.dart';
import 'package:flutter_app/design/image_const.dart';
import 'package:flutter_app/design/textstyles.dart';
import 'package:flutter_app/model/address.dart';
import 'package:flutter_app/model/weather.dart';
import 'package:flutter_app/providers/search_data.dart';
import 'package:flutter_app/providers/weather_data.dart';
import 'package:flutter_app/util/api_call.dart';
import 'package:flutter_app/util/current_location.dart';
import 'package:flutter_app/widgets/address_search.dart';
import 'package:flutter_app/widgets/current_weather.dart';
import 'package:flutter_app/widgets/daily_weather.dart';
import 'package:flutter_app/widgets/default_box1.dart';
import 'package:flutter_app/widgets/hourly_weather.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:geocoding/geocoding.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);

  Address address = Address();
  Weather weather = Weather();

  APICallService apiCallService = APICallService();
  CurrentLocation currentLocation = CurrentLocation();

  TextEditingController locationSerchController = TextEditingController();

  // addressStreamer(BuildContext context) async {
  //   List<Location> result;
  //   locationSerchController.addListener(() async {
  //     try {
  //       result = await locationFromAddress(locationSerchController.text.trim());
  //       address = Address.fromLocation(result.first);
  //       weather = await apiCallService.makeAPICall(address: address);
  //       context.watch<WeatherData>().setWeather(weather);
  //     } catch (e) {
  //       print(e);
  //     }
  //   });
  // }

  // getCurrentAddress(BuildContext context) async {
  //   weather = await apiCallService.makeAPICall(
  //       address: await currentLocation.getLocation());
  //   locationSerchController.text = "";
  //   context.watch<WeatherData>().setWeather(weather);
  // }

  @override
  Widget build(BuildContext context) {
    // final SearchData searchData =
    //     Provider.of<SearchData>(context, listen: false);
    // final SearchData searchData = Provider.of<SearchData>(context);
    // locationSerchController = TextEditingController(text: searchData.keyword);
    // getCurrentAddress(context);
    // addressStreamer(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            child: Row(
              children: [
                // /* TextFormField
                DefaultBox1(
                  height: 63,
                  width: 260,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(children: [
                      AddressSearchWidget(
                        controller: locationSerchController,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          icon_search,
                          height: 20,
                          width: 20,
                        ),
                      )
                    ]),
                  ),
                ),
                // */

                // /* Consumer in CurrentButton -> OKay
                Consumer<WeatherData>(
                    builder: (_, data, __) => InkWell(
                          onTap: () async {
                            CurrentLocation currentLocation = CurrentLocation();
                            Address address;
                            address = await currentLocation.getLocation();
                            context
                                .read<WeatherData>()
                                .setWeatherFromAddress(address);
                          },
                          child: Stack(alignment: Alignment.center, children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: SizedBox(
                                width: 50,
                                height: 63,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    CurrentLocation currentLocation =
                                        CurrentLocation();
                                    Address address;
                                    address =
                                        await currentLocation.getLocation();
                                    context
                                        .watch<WeatherData>()
                                        .setWeatherFromAddress(address);
                                  },
                                  child: null,
                                  style: ElevatedButton.styleFrom(
                                    primary: indigo_200,
                                    shadowColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    elevation: 5,
                                  ),
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              icon_map_pin,
                            )
                          ]),
                        )),
                // */
              ],
            ),
          ),
          Example(),
        ],
      ),
    );
  }
}

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: CurrentWeatherWidget(
                timezone: context.read<WeatherData>().weather.timezone ?? "",
                current: context.read<WeatherData>().weather.current!,
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
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 8.0),
                    //   child: HourlyWeatherWidget(
                    //       hourly: context.watch<WeatherData>().weather.hourly!),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}

/*


                



 */