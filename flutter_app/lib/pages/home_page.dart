import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/weather.dart';
import 'package:flutter_app/pages/main_page.dart';
import 'package:flutter_app/util/api_call.dart';
import 'package:flutter_app/util/current_location.dart';
import 'package:flutter_app/pages/current_weather_page.dart';
import 'package:flutter_app/pages/daily_page.dart';
import 'package:flutter_app/pages/daily_weather_page.dart';
import 'package:flutter_app/pages/hourly_weather_page.dart';
import 'package:flutter_app/design/themedata_page.dart';
import 'package:geocoding/geocoding.dart';

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
    controller = TabController(length: 2, vsync: this);
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
        children: [MainPage(), DailyPage()],
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
        ],
        controller: controller,
      ),
    );
  }
}
