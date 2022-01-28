import 'package:flutter/material.dart';
import 'package:flutter_app/design/colors.dart';
import 'package:flutter_app/model/address.dart';

import 'package:flutter_app/providers/search_data.dart';
import 'package:flutter_app/providers/weather_data.dart';
import 'package:provider/provider.dart';
import 'pages/splash_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherData>(create: (_) => WeatherData()),
        ChangeNotifierProvider<SearchData>(create: (_) => SearchData()),
      ],
      child: MaterialApp(
        theme: ThemeData(canvasColor: indigo_400),
        home: SplashPage(),
      ),
    );
  }
}
