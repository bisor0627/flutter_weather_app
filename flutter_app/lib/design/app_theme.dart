import 'package:flutter/material.dart';
import 'package:flutter_app/design/colors.dart';

class AppTheme {
  static get darkTheme => ThemeData(
        brightness: Brightness.dark,
        canvasColor: backgroundDark,
      );

  static get lightTheme => ThemeData(
        canvasColor: backgroundLight,
        brightness: Brightness.light,
      );
}


// extension AppThemeHelper on ThemeData {
//   ThemeData override({
//     Brightness? brightness = Brightness.light,
//     Color? color,
//     double? fontSize,
//     FontWeight? fontWeight,
//   }) =>
//       brightness == Brightness.light ? AppTheme.lightTheme() : copyWith();
// }

// extension ColorSchemeHelper on ColorScheme {
//   ColorScheme override(
//           {Color? primary,
//           Color? primaryVariant,
//           Color? secondary,
//           Color? secondaryVariant,
//           Color? surface,
//           Color? background,
//           Color? error,
//           Color? onPrimary,
//           Color? onSecondary,
//           Color? onSurface,
//           Color? onBackground,
//           Color? onError,
//           Brightness? brightness}) =>
//       brightness == Brightness.light
//           ? ColorScheme(
//               primary: primary ?? const Color(0xff6200ee),
//               primaryVariant: primaryVariant ?? const Color(0xff3700b3),
//               secondary: secondary ?? const Color(0xff03dac6),
//               secondaryVariant: secondaryVariant ?? const Color(0xff018786),
//               surface: surface ?? Colors.white,
//               background: background ?? Colors.white,
//               error: error ?? const Color(0xffb00020),
//               onPrimary: onPrimary ?? Colors.white,
//               onSecondary: onSecondary ?? Colors.black,
//               onSurface: onSurface ?? Colors.black,
//               onBackground: onBackground ?? Colors.black,
//               onError: onError ?? Colors.white,
//               brightness: brightness!)
//           : ColorScheme.dark();
// }
