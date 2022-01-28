import 'package:flutter/material.dart';
import 'package:flutter_app/design/colors.dart';
import 'package:flutter_app/design/image_const.dart';
import 'package:flutter_app/design/textstyles.dart';
import 'package:flutter_app/model/models.dart';
import 'package:flutter_app/pages/daily_page.dart';
import 'package:flutter_app/providers/weather_data.dart';
import 'package:flutter_app/util/api_call.dart';
import 'package:flutter_app/util/current_location.dart';
import 'package:flutter_app/widgets/address_search.dart';
import 'package:flutter_app/widgets/current_weather.dart';
import 'package:flutter_app/widgets/default_box1.dart';
import 'package:flutter_app/widgets/hourly_weather.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  Address address = Address();
  Weather weather = Weather();

  APICallService apiCallService = APICallService();
  CurrentLocation currentLocation = CurrentLocation();

  TextEditingController locationSerchController = TextEditingController();

  addressStreamer(BuildContext context) async {
    List<Location> result;
    locationSerchController.addListener(() async {
      try {
        result = await locationFromAddress(locationSerchController.text.trim());
        address = Address.fromLocation(result.first);
        weather = await apiCallService.makeAPICall(address: address);
        context.read<WeatherData>().setWeather(weather);
      } catch (e) {
        print(e);
      }
    });
  }

  getCurrentAddress(BuildContext context) async {
    CurrentLocation currentLocation = CurrentLocation();
    Address address;
    address = await currentLocation.getLocation();
    context.read<WeatherData>().setWeatherFromAddress(address);
  }

  @override
  Widget build(BuildContext context) {
    addressStreamer(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              searchAddressField(),
              ElevatedButton(
                onPressed: () async {
                  await getCurrentAddress(context);
                },
                child: SvgPicture.asset(
                  icon_map_pin,
                ),
                style: ElevatedButton.styleFrom(
                    primary: indigo_200,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: ButtonStyleButton.scaledPadding(
                      const EdgeInsets.symmetric(horizontal: 0),
                      const EdgeInsets.symmetric(horizontal: 0),
                      const EdgeInsets.symmetric(horizontal: 0),
                      MediaQuery.maybeOf(context)?.textScaleFactor ?? 0.1,
                    ),
                    elevation: 5,
                    fixedSize: Size(40, 63)),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.07),
          CurrentWeatherWidget(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          MiniTitle(title: "Today"),
          HourlyWeatherWidget(),
        ],
      ),
    );
  }

  DefaultBox1 searchAddressField() {
    return DefaultBox1(
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
    );
  }
}
