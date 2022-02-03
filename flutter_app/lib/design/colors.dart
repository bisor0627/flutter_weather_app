import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

var brightness = SchedulerBinding.instance!.window.platformBrightness;

/// *light & dark mode* background
Color background =
    brightness == Brightness.light ? fromHex('828CAE') : fromHex('101A39');

/// *light & dark mode* Accent Button
Color lilac = fromHex('A7B4E0');

/// *dark mode* Default Button
Color charcoal = fromHex('2C303F');

/// *dark mode* Tabbar Background
Color darkNavy = fromHex('101A39');

/// *dark mode* Tabbar Icon
Color softNavy = fromHex('557EAE');

/// *light mode* TextButton
Color navy = fromHex('002688');

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
