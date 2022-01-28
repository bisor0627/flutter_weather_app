import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/address.dart';
import 'package:flutter_app/pages/tab_page.dart';
import 'package:flutter_app/providers/weather_data.dart';
import 'package:flutter_app/util/current_location.dart';
import 'package:flutter_app/widgets/default_box1.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;
  int _second = 3; // set timer for 3 second and then direct to next page

  Address address = Address();
  final CurrentLocation _currentLocation = CurrentLocation();

  void _startTimer() {
    const period = Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      _second--;
      if (_second == 0) {
        _cancelFlashsaleTimer();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const TabPage()),
            (Route<dynamic> route) => false);
      }
    });
  }

  void _cancelFlashsaleTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  Future getAddressAction() async {
    if (await Permission.location.request().isGranted) {
      address = await _currentLocation.getLocation();
    } else {
      address = Address.fromDouble(latitude: 37.513272, longitude: 127.094317);
    }
    context.read<WeatherData>().setWeatherFromAddress(address);
  }

  @override
  void initState() {
    getAddressAction();
    if (_second != 0) {
      _startTimer();
    }
    super.initState();
  }

  @override
  void dispose() {
    _cancelFlashsaleTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SvgPicture.asset(
          "assets/images/1232n.svg",
          color: Colors.white,
        ),
      )),
    );
  }
}
