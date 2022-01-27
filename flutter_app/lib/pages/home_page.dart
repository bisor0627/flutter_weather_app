import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/design/colors.dart';
import 'package:flutter_app/design/image_const.dart';
import 'package:flutter_app/design/textstyles.dart';
import 'package:flutter_app/model/models.dart';
import 'package:flutter_app/providers/weather_data.dart';
import 'package:flutter_app/util/api_call.dart';
import 'package:flutter_app/util/current_location.dart';
import 'package:flutter_app/widgets/current_weather.dart';
import 'package:flutter_app/widgets/hourly_weather.dart';
import 'package:flutter_app/widgets/default_box1.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
    weather = await apiCallService.makeAPICall(address: address);
    addressStreamController.add(address);
  }

  /// stream에 검색어를 넣고 api에서 Address(위도와 경도)를 얻음
  addressStreamer() async {
    List<Location> result;
    locationSerchController.addListener(() async {
      try {
        result = await locationFromAddress(locationSerchController.text.trim());
        address = Address.fromLocation(result.first);
        weather = await apiCallService.makeAPICall(address: address);
        addressStreamController.add(address);
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getCurrentAddress();
    addressStreamer();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Align(
                child: locationRow(context),
                alignment: Alignment(0.0, 0.3),
              ),
            ),
            StreamBuilder<Address>(
              stream: addressStreamController.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: CurrentWeatherWidget(
                          timezone: weather.timezone ?? "",
                          current: weather.current!,
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
                                padding: const EdgeInsets.only(
                                    left: 20.0, bottom: 8.0),
                                child: Text(
                                  "Today",
                                  textAlign: TextAlign.left,
                                  style: title3.override(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w200),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: HourlyWeatherWidget(
                                    hourly: weather.hourly!),
                              ),
                            ],
                          ),
                        ),
                      ),
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

  Widget locationRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DefaultBox1(
          height: 63,
          width: 260,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(children: [
              TextFormField(
                controller: locationSerchController,
                textInputAction: TextInputAction.go,
                onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
                cursorColor: whiteA700,
                style: TextStyle(
                    fontFamily: primaryFontFamily,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: 18,
                    height: 1),
                decoration: const InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                      fontFamily: primaryFontFamily,
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 18,
                      height: 1),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: InputBorder.none,
                ),
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
        defaultButton1(),
      ],
    );
  }

  Widget defaultButton1() {
    return Stack(alignment: Alignment.center, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          width: 50,
          height: 63,
          child: ElevatedButton(
            onPressed: () {
              getCurrentAddress();
              locationSerchController.text = "";
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
    ]);
  }
}
