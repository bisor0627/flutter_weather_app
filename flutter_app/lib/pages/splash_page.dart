import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;
  int _second = 3; // set timer for 3 second and then direct to next page

  void _startTimer() {
    const period = Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      _second--;
      if (_second == 0) {
        _cancelFlashsaleTimer();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
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

  @override
  void initState() {
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
        child: Text("감자감자"),
      ),
    );
  }
}
