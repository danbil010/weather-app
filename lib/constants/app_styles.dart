import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_fonts.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

// Extra Large text style (Bold weight)
TextStyle getxxLargeTextStyle({double? fontSize, required Color color}) {
  return _getTextStyle(
      fontSize!, AppFontConstants.fontFamily, AppFontWeight.black, color);
}

// Extra Large text style (Bold weight)
TextStyle getExtraLargeTextStyle({double? fontSize, required Color color}) {
  return _getTextStyle(
      fontSize!, AppFontConstants.fontFamily, AppFontWeight.bold, color);
}

// Large text style (Semi-Bold weight)
TextStyle getLargeTextStyle({double? fontSize, required Color color}) {
  return _getTextStyle(
      fontSize!, AppFontConstants.fontFamily, AppFontWeight.semiBold, color);
}

// Medium text style (Medium weight)
TextStyle getMediumTextStyle({double? fontSize, required Color color}) {
  return _getTextStyle(
      fontSize!, AppFontConstants.fontFamily, AppFontWeight.medium, color);
}

// Small text style (Regular weight)
TextStyle getSmallTextStyle({double? fontSize, required Color color}) {
  return _getTextStyle(
      fontSize!, AppFontConstants.fontFamily, AppFontWeight.regular, color);
}

// Extra Small text style (Light weight)
TextStyle getExtraSmallTextStyle({double? fontSize, required Color color}) {
  return _getTextStyle(
      fontSize!, AppFontConstants.fontFamily, AppFontWeight.light, color);
}
