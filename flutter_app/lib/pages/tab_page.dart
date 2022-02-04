import 'package:flutter/material.dart';
import 'package:flutter_app/design/colors.dart';
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
  late TabController controller;

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
    Color unSelectedIcon = isDark(context) ? softNavy : Colors.black;
    return Scaffold(
      body: TabBarView(
        children: [HomePage(), DailyPage()],
        controller: controller,
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: isDark(context) ? darkNavy : lilac,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: TabBar(
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
                color: Colors.black,
                size: 20,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.black,
                size: 20,
              ),
            ),
          ],
          controller: controller,
        ),
      ),
    );
  }
}
