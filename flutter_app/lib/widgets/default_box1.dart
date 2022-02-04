import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/design/colors.dart';
import 'package:flutter_app/design/textstyles.dart';

class DefaultBox1 extends StatelessWidget {
  DefaultBox1(
      {Key? key,
      required this.width,
      required this.height,
      this.color,
      this.child,
      this.isAccent = false})
      : super(key: key);
  bool isAccent;

  final double width;
  final double height;
  Color? color;
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: isAccent
            ? lilac
            : isDark(context)
                ? charcoal
                : Colors.white,
      ),
      child: child,
    );
  }
}
