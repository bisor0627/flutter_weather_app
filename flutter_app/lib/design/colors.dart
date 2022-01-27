import 'dart:ui';
import 'package:flutter/material.dart';

Color bluegray_900 = fromHex('#262e3b');

Color indigo_400 = fromHex('#547dad');

Color indigo_200 = fromHex('#a8b5e0');

Color black_900 = fromHex('#000000');

Color bluegray_400 = fromHex('#888888');

Color black_900_40 = fromHex('#40000000');

Color gray_900 = fromHex('#050d26');

Color indigoA200 = fromHex('#5778e0');

Color indigo_900 = fromHex('#002687');

Color whiteA700 = fromHex('#ffffff');

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
