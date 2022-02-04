import 'package:flutter/material.dart';
import 'package:flutter_app/design/app_theme.dart';
import 'package:flutter_app/providers/search_data.dart';
import 'package:flutter_app/providers/weather_data.dart';
import 'package:provider/provider.dart';
import 'pages/splash_page.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => ChangeNotifierProvider<ThemeNotifier>(
    //     create: (BuildContext context) {
    //       return ThemeNotifier(
    //         ThemeMode.system,
    //       );
    //     },
    //     child: MyApp(),
    //   ),
    // ),
    MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherData>(create: (_) => WeatherData()),
        ChangeNotifierProvider<SearchData>(create: (_) => SearchData()),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const SplashPage(),
      ),
    );
  }
}
