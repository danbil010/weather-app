import 'package:flutter/material.dart';

class AppColor {
  // Primary Colors
  static Color primaryColor = HexColor.fromHex("#8130EF");
  static Color lightPrimary = HexColor.fromHex("#F8F3FE");
  static Color splashBackground = HexColor.fromHex("#440D7E");
  
  // Weather App Specific Colors
  static Color weatherBlue = HexColor.fromHex("#2196F3");
  static Color weatherLightBlue = HexColor.fromHex("#E3F2FD");
  static Color weatherDarkBlue = HexColor.fromHex("#1976D2");
  static Color weatherGradientStart = HexColor.fromHex("#42A5F5");
  static Color weatherGradientEnd = HexColor.fromHex("#1976D2");
  
  // Basic Colors
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color black = HexColor.fromHex("#2E2E2E");
  static Color background = HexColor.fromHex("#F8F3FE");
  
  // Grey Scale
  static Color grey = HexColor.fromHex("#757575");
  static Color lightGrey = HexColor.fromHex("#F5F5F5");
  static Color darkGrey = HexColor.fromHex("#424242");
  static Color mediumGrey = HexColor.fromHex("#9E9E9E");
  
  // Status Colors
  static Color red = HexColor.fromHex("#E51211");
  static Color green = HexColor.fromHex("#14C21B");
  static Color orange = HexColor.fromHex("#FF9800");
  static Color yellow = HexColor.fromHex("#FFC107");
  
  // Border and Shadow
  static Color border = HexColor.fromHex("#E0E0E0");
  static Color shadow = HexColor.fromHex("#000000");
  
  // Weather Icons and UI
  static Color weatherIcon = HexColor.fromHex("#FFA726");
  static Color weatherText = HexColor.fromHex("#FFFFFF");
  static Color weatherSubtext = HexColor.fromHex("#E3F2FD");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
