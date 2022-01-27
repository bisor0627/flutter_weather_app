import 'package:flutter/material.dart';
import 'package:flutter_app/design/colors.dart';
import 'package:flutter_app/providers/weather_data.dart';
import 'package:flutter_app/util/current_location.dart';
import 'package:provider/provider.dart';
import 'util/location_permission.dart';
import 'pages/splash_page.dart';

void main() async {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => WeatherData())],
    child: MyApp(),
  ));

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
    return MaterialApp(
      theme: ThemeData(
          // scaffoldBackgroundColor: backgroundLight,
          canvasColor: indigo_400),
      home: SplashPage(),
    );
  }
}
