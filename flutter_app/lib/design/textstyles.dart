import 'package:flutter/material.dart';
import 'package:flutter_app/design/colors.dart';
import 'package:google_fonts/google_fonts.dart';

const String primaryFontFamily = 'Roboto Slab';
const String secondaryFontFamily = 'Roboto';
TextStyle get mainTemp => TextStyle(
    color: whiteA700,
    fontFamily: primaryFontFamily,
    fontSize: 44,
    fontWeight: FontWeight.w500,
    height: 1);
TextStyle get title1 => TextStyle(
    color: whiteA700,
    fontFamily: primaryFontFamily,
    fontSize: 26,
    fontWeight: FontWeight.w500,
    height: 1);
TextStyle get title2 => GoogleFonts.getFont(primaryFontFamily,
    color: whiteA700, fontWeight: FontWeight.w400, fontSize: 16, height: 1);
TextStyle get title3 => GoogleFonts.getFont(primaryFontFamily,
    color: whiteA700, fontWeight: FontWeight.w100, fontSize: 14, height: 1);
TextStyle get subtitle1 => GoogleFonts.getFont(
      primaryFontFamily,
      color: whiteA700,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    );
TextStyle get subtitle2 => GoogleFonts.getFont(
      primaryFontFamily,
      color: whiteA700,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    );
TextStyle get bodyText1 => GoogleFonts.getFont(
      primaryFontFamily,
      color: whiteA700,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    );
TextStyle get bodyText2 => GoogleFonts.getFont(
      primaryFontFamily,
      color: whiteA700,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    );

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    bool useGoogleFonts = true,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily ?? primaryFontFamily,
              color: color ?? whiteA700,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
            )
          : copyWith(
              fontFamily: fontFamily ?? primaryFontFamily,
              color: color ?? whiteA700,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
            );
}
