import 'package:flutter/material.dart';
import 'package:flutter_app/design/colors.dart';
import 'package:flutter_app/providers/search_data.dart';
import 'package:flutter_app/providers/weather_data.dart';
import 'package:flutter_app/util/current_location.dart';
import 'package:provider/provider.dart';
import 'util/location_permission.dart';
import 'pages/splash_page.dart';

void main() async {
  runApp(MyApp());

  PermissionLocation _permissionLocation = PermissionLocation();
  CurrentLocation _currentLocation = CurrentLocation();

  await _permissionLocation.checkPermissions().then((value) {
    _currentLocation.getLocation();
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<WeatherData>(
    //     create: (_) => WeatherData(),
    //     child: MaterialApp(
    //       theme: ThemeData(
    //           canvasColor: indigo_400),
    //       home: SplashPage(),
    //     ));
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
