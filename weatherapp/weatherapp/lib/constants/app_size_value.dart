import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

extension AppMediaQuery on GetInterface {
  /// Returns the screen height of the device.
  double get screenHeight => Get.context!.mediaQuery.size.height;

  /// Returns the screen width of the device.
  double get screenWidth => Get.context!.mediaQuery.size.width;

  /// Returns the device's pixel density.
  double get devicePixelRatio => Get.context!.mediaQuery.devicePixelRatio;

  /// Returns the height of the status bar.
  double get statusBarHeight => Get.context!.mediaQuery.padding.top;

  /// Returns the height of the bottom safe area.
  double get bottomPadding => Get.context!.mediaQuery.padding.bottom;

  /// Returns the text scaler.
  TextScaler get textScaler => MediaQuery.textScalerOf(Get.context!);

  /// Checks if the device is in landscape mode.
  bool get isLandscape =>
      Get.context!.mediaQuery.orientation == Orientation.landscape;

  /// Checks if the device is in portrait mode.
  bool get isPortrait =>
      Get.context!.mediaQuery.orientation == Orientation.portrait;
}

class AppRadius {
  static double get veryTiny => 4.r;
  static double get tiny => 8.r;
  static double get verySmall => 9.r;
  static double get small => 10.r;
  static double get medium => 20.r;
  static double get large => 30.r;
  static double get extraLarge => 80.r;
}

class AppSpacing {
  // Vertical Spacing
  static double get vs2 => 2.h;
  static double get vs4 => 4.h;
  static double get vs5 => 5.h;
  static double get vs6 => 6.h;
  static double get vs7 => 7.h;
  static double get vs8 => 8.h;
  static double get vs10 => 10.h;
  static double get vs12 => 12.h;
  static double get vs16 => 16.h;
  static double get vs20 => 20.h;
  static double get vs24 => 24.h;
  static double get vs32 => 32.h;
  static double get vs40 => 40.h;
  static double get vs48 => 48.h;

  // Horizontal Spacing
  static double get hs2 => 2.w;
  static double get hs4 => 4.w;
  static double get hs8 => 8.w;
  static double get hs12 => 12.w;
  static double get hs16 => 16.w;
  static double get hs24 => 24.w;
  static double get hs32 => 32.w;
  static double get hs48 => 48.w;
  static double get hs150 => 150.w;
}

class AppMargin {
  // Horizontal Margins
  static double get hm2 => 2.w;
  static double get hm4 => 4.w;
  static double get hm8 => 8.w;
  static double get hm12 => 12.w;
  static double get hm16 => 16.w;
  static double get hm18 => 18.w;
  static double get hm20 => 20.w;
  static double get hm24 => 24.w;
  static double get hm32 => 32.w;
  static double get hm40 => 40.w;
  static double get hm48 => 48.w;
  static double get hm56 => 56.w;
  static double get hm64 => 64.w;
  static double get hm72 => 72.w;
  static double get hm80 => 80.w;

  // Vertical Margins
  static double get vm2 => 2.h;
  static double get vm3 => 3.h;
  static double get vm4 => 4.h;
  static double get vm8 => 8.h;
  static double get vm12 => 12.h;
  static double get vm16 => 16.h;
  static double get vm20 => 20.h;
  static double get vm24 => 24.h;
  static double get vm32 => 32.h;
  static double get vm40 => 40.h;
  static double get vm48 => 48.h;
  static double get vm56 => 56.h;
  static double get vm64 => 64.h;
  static double get vm72 => 72.h;
  static double get vm80 => 80.h;
}

class AppIconSize {
  // Icon Sizes
  static double get xxxSmall => 10.w;
  static double get xxSmall => 11.w;
  static double get xSmall => 12.w;
  static double get small => 16.w;
  static double get medium => 20.w;
  static double get large => 24.w;
  static double get xLarge => 32.w;
  static double get xxLarge => 38.w;
  static double get xxxLarge => 44.w;
  static double get huge => 50.w;
  static double get xHuge => 56.w;
  static double get xxHuge => 62.w;
  static double get xxxHuge => 68.w;
}

class AppSize {
  // Heights
  static double get h1 => 1.h;
  static double get h2 => 2.h;
  static double get h3 => 3.h;
  static double get h4 => 4.h;
  static double get h5 => 5.h;
  static double get h8 => 8.h;
  static double get h10 => 10.h;
  static double get h12 => 12.h;
  static double get h16 => 16.h;
  static double get h20 => 20.h;
  static double get h24 => 24.h;
  static double get h28 => 28.h;
  static double get h32 => 32.h;
  static double get h35 => 35.h;
  static double get h40 => 40.h;
  static double get h45 => 45.h;
  static double get h50 => 50.h;
  static double get h48 => 48.h;
  static double get h56 => 56.h;
  static double get h60 => 60.h;
  static double get h62 => 62.h;
  static double get h64 => 64.h;
  static double get h66 => 66.h;
  static double get h68 => 68.h;
  static double get h70 => 70.h;
  static double get h72 => 72.h;
  static double get h76 => 76.h;
  static double get h80 => 80.h;
  static double get h82 => 82.h;
  static double get h88 => 88.h;
  static double get h96 => 96.h;
  static double get h100 => 100.h;
  static double get h110 => 110.h;
  static double get h120 => 120.h;
  static double get h125 => 125.h;
  static double get h130 => 130.h;
  static double get h140 => 140.h;
  static double get h150 => 150.h;
  static double get h160 => 160.h;
  static double get h180 => 180.h;
  static double get h190 => 190.h;
  static double get h200 => 200.h;
  static double get h220 => 220.h;
  static double get h210 => 210.h;
  static double get h240 => 240.h;
  static double get h260 => 260.h;
  static double get h280 => 280.h;
  static double get h300 => 300.h;
  static double get h320 => 320.h;
  static double get h340 => 340.h;
  static double get h360 => 360.h;
  static double get h380 => 380.h;
  static double get h400 => 400.h;
  static double get h420 => 420.h;
  static double get h440 => 440.h;
  static double get h460 => 460.h;
  static double get h480 => 480.h;
  static double get h500 => 500.h;
  static double get h550 => 550.h;
  static double get h600 => 600.h;
  static double get h650 => 650.h;
  static double get h700 => 700.h;
  static double get h750 => 750.h;
  static double get h800 => 800.h;
  static double get h850 => 850.h;
  static double get h900 => 900.h;
  static double get h950 => 950.h;
  static double get h1000 => 1000.h;
  static double get h1050 => 1050.h;
  static double get h1100 => 1100.h;
  static double get h1150 => 1150.h;
  static double get h1200 => 1200.h;
  static double get h1250 => 1250.h;
  static double get h1300 => 1300.h;
  static double get h1350 => 1350.h;
  static double get h1400 => 1400.h;
  static double get h1450 => 1450.h;
  static double get h1500 => 1500.h;

  // Widths
  static double get w2 => 2.w;
  static double get w4 => 4.w;
  static double get w8 => 8.w;
  static double get w10 => 10.w;
  static double get w12 => 12.w;
  static double get w16 => 16.w;
  static double get w20 => 20.w;
  static double get w24 => 24.w;
  static double get w32 => 32.w;
  static double get w35 => 35.w;
  static double get w40 => 40.w;
  static double get w45 => 45.w;
  static double get w48 => 48.w;
  static double get w56 => 56.w;
  static double get w64 => 64.w;
  static double get w72 => 72.w;
  static double get w76 => 76.w;
  static double get w80 => 80.w;
  static double get w88 => 88.w;
  static double get w90 => 90.w;
  static double get w96 => 96.w;
  static double get w100 => 100.w;
  static double get w110 => 110.w;
  static double get w120 => 120.w;
  static double get w140 => 140.w;
  static double get w160 => 160.w;
  static double get w180 => 180.w;
  static double get w200 => 200.w;
  static double get w220 => 220.w;
  static double get w240 => 240.w;
  static double get w260 => 260.w;
  static double get w280 => 280.w;
  static double get w300 => 300.w;
  static double get w320 => 320.w;
  static double get w340 => 340.w;
  static double get w360 => 360.w;
  static double get w380 => 380.w;
  static double get w400 => 400.w;
  static double get w420 => 420.w;
  static double get w440 => 440.w;
  static double get w445 => 445.w;
  static double get w450 => 450.w;
  static double get w460 => 460.w;
  static double get w480 => 480.w;
  static double get w500 => 500.w;
  static double get w550 => 550.w;
  static double get w600 => 600.w;
  static double get w650 => 650.w;
  static double get w700 => 700.w;
  static double get w750 => 750.w;
  static double get w800 => 800.w;
  static double get w850 => 850.w;
  static double get w900 => 900.w;
  static double get w950 => 950.w;
  static double get w1000 => 1000.w;
  static double get w1050 => 1050.w;
  static double get w1100 => 1100.w;
  static double get w1150 => 1150.w;
  static double get w1200 => 1200.w;
  static double get w1250 => 1250.w;
  static double get w1300 => 1300.w;
  static double get w1350 => 1350.w;
  static double get w1400 => 1400.w;
  static double get w1450 => 1450.w;
  static double get w1500 => 1500.w;
}

class AppPadding {
  // Horizontal Padding
  static double get hp1 => 1.w;
  static double get hp2 => 2.w;
  static double get hp4 => 4.w;
  static double get hp8 => 8.w;
  static double get hp10 => 10.w;
  static double get hp12 => 12.w;
  static double get hp14 => 14.w;
  static double get hp16 => 16.w;
  static double get hp18 => 18.w;
  static double get hp20 => 20.w;
  static double get hp24 => 24.w;
  static double get hp32 => 32.w;
  static double get hp40 => 40.w;
  static double get hp48 => 48.w;
  static double get hp56 => 56.w;
  static double get hp64 => 64.w;
  static double get hp72 => 72.w;
  static double get hp80 => 80.w;

  // Vertical Padding
  static double get vp2 => 2.h;
  static double get vp4 => 4.h;
  static double get vp6 => 6.h;
  static double get vp8 => 8.h;
  static double get vp10 => 10.h;
  static double get vp12 => 12.h;
  static double get vp16 => 16.h;
  static double get vp20 => 20.h;
  static double get vp24 => 24.h;
  static double get vp32 => 32.h;
  static double get vp40 => 40.h;
  static double get vp48 => 48.h;
  static double get vp56 => 56.h;
  static double get vp64 => 64.h;
  static double get vp72 => 72.h;
  static double get vp80 => 80.h;
}
