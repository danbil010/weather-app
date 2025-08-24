import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/utils/dialog_utils.dart';
import '../../controller/weather_controller.dart';
import '../../constants/app_color.dart';
import '../../constants/app_styles.dart';
import '../../constants/app_size_value.dart';
import '../../constants/app_fonts.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../../constants/app_string.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final WeatherController controller = Get.find<WeatherController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.weatherLightBlue,
      appBar: CustomAppBar(
        title: AppStrings.favoriteCities,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.weatherBlue,
        titleColor: AppColor.white,
      ),
      body: Obx(() {
        if (controller.favoriteCities.isEmpty) {
          return _buildEmptyState();
        }

        return ListView.builder(
          padding: EdgeInsets.all(AppSize.h16),
          itemCount: controller.favoriteCities.length,
          itemBuilder: (context, index) {
            final city = controller.favoriteCities[index];
            return _buildFavoriteCityCard(city);
          },
        );
      }),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: AppSize.h100,
            color: AppColor.mediumGrey,
          ),
          SizedBox(height: AppSize.h24),
          Text(
            AppStrings.noFavoriteCities,
            style: getLargeTextStyle(
              fontSize: AppFontSize.xxLarge,
              color: AppColor.darkGrey,
            ),
          ),
          SizedBox(height: AppSize.h16),
          Text(
            AppStrings.addCitiesToFavorites,
            style: getMediumTextStyle(
              fontSize: AppFontSize.large,
              color: AppColor.grey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSize.h32),
          SizedBox(
            width: Get.width * 0.9,
            child: CustomButton(
              text: AppStrings.addFavorites,
              onPressed: () {
                controller.clearError();
                showDefaultDialog(
                  title: AppStrings.switchToWeatherTabMessage,
                  buttonText: AppStrings.ok,
                );
              },
              backgroundColor: AppColor.weatherBlue,
              textColor: AppColor.white,
              prefixIcon: Icon(Icons.add, color: AppColor.white),
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.w24, vertical: AppSize.h12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteCityCard(Map<String, dynamic> city) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSize.h16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(AppRadius.medium),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadow.withOpacity(0.1),
            spreadRadius: AppSize.h1,
            blurRadius: AppSize.h5,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(AppSize.h16),
        leading: CircleAvatar(
          backgroundColor: AppColor.weatherLightBlue,
          child: Icon(
            Icons.location_city,
            color: AppColor.weatherBlue,
          ),
        ),
        title: Text(
          city['cityName'] ?? AppStrings.unknownCity,
          style: getLargeTextStyle(
            fontSize: AppFontSize.xLarge,
            color: AppColor.black,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                // Navigate to weather screen with this city
                controller.getCurrentWeatherByCity(city['cityName']);
                // Switch to weather tab
                controller.switchToWeatherTab();
                controller.clearError();
              },
              icon: const Icon(Icons.visibility),
              tooltip: AppStrings.viewWeather,
            ),
            IconButton(
              onPressed: () {
                controller.removeFromFavorites(city['cityName']);
              },
              icon: const Icon(Icons.delete),
              tooltip: AppStrings.removeFromFavorites,
            ),
          ],
        ),
      ),
    );
  }
}
