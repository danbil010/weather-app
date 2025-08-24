import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/constants/app_color.dart';
import 'package:weatherapp/constants/app_string.dart';
import 'package:weatherapp/constants/app_styles.dart';
import 'package:weatherapp/constants/app_size_value.dart';
import 'package:weatherapp/screens/dashboard_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      Get.to(() => DashboardScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColor.splashBackground,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSize.h10,
            children: [
              Icon(
                Icons.cloud,
                size: AppSize.h80,
                color: AppColor.white,
              ),
              
              Text(
                AppStrings.appName,
                style: getExtraLargeTextStyle(
                  fontSize: 32,
                  color: AppColor.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
