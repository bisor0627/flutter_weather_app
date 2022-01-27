import 'package:flutter/material.dart';

class DefaultBox1 extends StatelessWidget {
  DefaultBox1({
    Key? key,
    required this.width,
    required this.height,
    this.color,
    this.child,
  }) : super(key: key);
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
        color: color ?? Color.fromRGBO(167, 180, 224, 1),
      ),
      child: child,
    );
  }
}
