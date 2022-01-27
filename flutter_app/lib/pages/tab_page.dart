import 'package:flutter/material.dart';
import 'package:flutter_app/pages/%20test_page.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/daily_page.dart';

// Todo! 전역 location data -> mainPage에서만 사용하기
// Todo! Permission -> main.dart로 이사하기
class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TabPage>
    with SingleTickerProviderStateMixin {
  Map<String, dynamic> weatherData = {};
  late TabController controller;
  // var getData;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
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
        children: [HomePage(), DailyPage(), TestPage()],
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
