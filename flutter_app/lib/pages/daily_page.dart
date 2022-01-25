import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';

class DailyPage extends StatelessWidget {
  DailyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SingleChildScrollView(
            scrollDirection: Axis.horizontal, child: Text("adfdsaf"))
      ]),
    );
  }
}
