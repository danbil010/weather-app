import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/weather_controller.dart';
import 'package:weatherapp/screens/setting/setting_screen.dart';
import 'package:weatherapp/widgets/custom_bottom_nav_bar.dart';
import 'package:weatherapp/constants/app_color.dart';
import 'package:weatherapp/constants/app_string.dart';

import 'weather/weather_screen.dart';
import 'weather/favorites_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final WeatherController weatherController = Get.put(WeatherController());

  void _onItemTapped(int index) {
    weatherController.currentTabIndex.value = index;
  }

  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.cloud, 'label': AppStrings.weather},
    {'icon': Icons.favorite, 'label': AppStrings.favorites},
    {'icon': Icons.settings, 'label': AppStrings.settings},
  ];

  final List<Widget> _screens = [
    WeatherScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Obx(() => _screens[weatherController.currentTabIndex.value]),
      bottomNavigationBar: Obx(() => CustomBottomNavBar(
            currentIndex: weatherController.currentTabIndex.value,
            onTap: _onItemTapped,
            navItems: _navItems,
          )),
    );
  }
}
