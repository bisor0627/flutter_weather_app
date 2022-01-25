import 'package:flutter/material.dart';
import 'location/current_location.dart';
import 'pages/splash_page.dart';

void main() async {
  runApp(MyApp());

  CurrentLocation currentLocation = CurrentLocation();
  await currentLocation.checkPermissions().then((value) {
    print(value);
    currentLocation.getLocation();
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: SplashPage(),
    );
  }
}
