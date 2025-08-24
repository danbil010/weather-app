import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/constants/app_size_value.dart';
import 'package:weatherapp/constants/app_color.dart';
import 'package:weatherapp/constants/app_styles.dart';
import 'package:weatherapp/constants/app_fonts.dart';
import 'package:weatherapp/utils/custom_app_loader.dart';
import '../../controller/weather_controller.dart';
import '../../widgets/text_fields/custom_search_field.dart';
import '../../widgets/custom_button.dart';
import '../../constants/app_string.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({super.key});

  final WeatherController controller = Get.find<WeatherController>();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.weatherLightBlue,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                      child: CustomAppLoader(
                    size: AppIconSize.xxLarge,
                  ));
                }

                if (controller.errorMessage.value.isNotEmpty) {
                  return _buildErrorWidget();
                }

                if (controller.currentWeather.value == null) {
                  return _buildWelcomeWidget();
                }

                return SingleChildScrollView(
                  padding: EdgeInsets.all(AppSize.h12),
                  child: Column(
                    spacing: AppSize.h20,
                    children: [
                      _buildCurrentWeather(),
                      _buildForecast(),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.all(AppSize.h16),
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.shadow.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: CustomSearchField(
              controller: searchController,
              hintText: AppStrings.searchCity,
              prefixIcon: Icons.search,
              backgroundColor: AppColor.lightGrey,
              hintColor: AppColor.grey,
              iconColor: AppColor.grey,
              borderRadius: AppRadius.small,
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppSize.w16,
                vertical: AppSize.h12,
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  controller.getCurrentWeatherByCity(value);
                }
              },
            ),
          ),
          SizedBox(width: AppSize.w12),
          IconButton(
            onPressed: () => controller.getCurrentLocationWeather(),
            icon: const Icon(Icons.my_location),
            style: IconButton.styleFrom(
              backgroundColor: AppColor.weatherBlue,
              foregroundColor: AppColor.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud,
            size: AppSize.h100,
            color: AppColor.weatherBlue,
          ),
          SizedBox(height: AppSize.h24),
          Text(
            AppStrings.welcomeToWeatherApp,
            style: getLargeTextStyle(
              fontSize: AppFontSize.xxLarge,
              color: AppColor.darkGrey,
            ),
          ),
          SizedBox(height: AppSize.h16),
          Text(
            AppStrings.searchForCityOrUseLocation,
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
              text: AppStrings.useCurrentLocation,
              onPressed: () => controller.getCurrentLocationWeather(),
              backgroundColor: AppColor.weatherBlue,
              textColor: AppColor.white,
              prefixIcon: Icon(Icons.my_location, color: AppColor.white),
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.w24, vertical: AppSize.h12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: AppSize.h80,
            color: AppColor.red,
          ),
          const SizedBox(height: 16),
          Text(
            AppStrings.error,
            style: getLargeTextStyle(
              fontSize: AppFontSize.xLarge,
              color: AppColor.red,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.w32),
            child: Text(
              controller.errorMessage.value,
              style: getMediumTextStyle(
                fontSize: AppFontSize.large,
                color: AppColor.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          if (controller.errorMessage.value.contains('permission')) ...[
            Text(
              '${AppStrings.toFixThis}\n${AppStrings.goToSettingsAppsWeatherAppPermissions}\n${AppStrings.enableLocationPermission}\n${AppStrings.tryAgainInstruction}',
              style: getSmallTextStyle(
                fontSize: AppFontSize.medium,
                color: AppColor.mediumGrey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
          ],
          SizedBox(
            width: Get.width * 0.9,
            child: CustomButton(
              text: AppStrings.tryAgain,
              backgroundColor: AppColor.weatherBlue,
              onPressed: () {
                controller.clearError();
                controller.getCurrentLocationWeather();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentWeather() {
    final weather = controller.currentWeather.value!;
    final cityName = controller.currentCity.value;

    return Container(
      padding: EdgeInsets.all(AppSize.h20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.weatherGradientStart, AppColor.weatherGradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppRadius.medium),
        boxShadow: [
          BoxShadow(
            color: AppColor.weatherBlue.withOpacity(0.3),
            spreadRadius: AppSize.h2,
            blurRadius: AppSize.h10,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cityName,
                      style: getLargeTextStyle(
                        fontSize: AppFontSize.xLarge,
                        color: AppColor.weatherText,
                      ),
                    ),
                    Text(
                      DateFormat('EEEE, MMMM d').format(weather.dateTime),
                      style: getMediumTextStyle(
                        fontSize: AppFontSize.large,
                        color: AppColor.weatherSubtext,
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() => IconButton(
                    onPressed: () async {
                      if (controller.isCurrentCityFavorite.value) {
                        controller.removeFromFavorites(cityName);
                      } else {
                        controller.addToFavorites(cityName, 0, 0);
                      }
                    },
                    icon: Icon(
                      controller.isCurrentCityFavorite.value
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: AppColor.weatherText,
                      size: AppIconSize.large,
                    ),
                  )),
            ],
          ),
          SizedBox(height: AppSize.h24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${controller.convertTemperature(weather.temperature).round()}${controller.getTemperatureSymbol()}',
                    style: getExtraLargeTextStyle(
                      fontSize: AppFontSize.xxxLarge,
                      color: AppColor.weatherText,
                    ),
                  ),
                  Text(
                    '${AppStrings.feelsLike} ${controller.convertTemperature(weather.feelsLike).round()}${controller.getTemperatureSymbol()}',
                    style: getMediumTextStyle(
                      fontSize: AppFontSize.large,
                      color: AppColor.weatherSubtext,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.network(
                    'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                    width: AppSize.w80,
                    height: AppSize.h80,
                  ),
                  Text(
                    weather.description.toUpperCase(),
                    style: getMediumTextStyle(
                      fontSize: AppFontSize.large,
                      color: AppColor.weatherText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildWeatherDetail(AppStrings.humidity, '${weather.humidity}%',
                  Icons.water_drop),
              _buildWeatherDetail(AppStrings.wind,
                  '${weather.windSpeed} ${AppStrings.mps}', Icons.air),
              _buildWeatherDetail(AppStrings.pressure,
                  '${weather.pressure} ${AppStrings.hpa}', Icons.compress),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetail(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppColor.weatherSubtext,
          size: AppSize.h24,
        ),
        SizedBox(height: AppSize.h8),
        Text(
          value,
          style: getLargeTextStyle(
            fontSize: AppFontSize.large,
            color: AppColor.weatherText,
          ),
        ),
        Text(
          label,
          style: getSmallTextStyle(
            fontSize: AppFontSize.small,
            color: AppColor.weatherSubtext,
          ),
        ),
      ],
    );
  }

  Widget _buildForecast() {
    final forecast = controller.forecast.value;
    if (forecast == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.sevenDayForecast,
          style: getLargeTextStyle(
            fontSize: AppFontSize.xLarge,
            color: AppColor.black,
          ),
        ),
        SizedBox(height: AppSize.h16),
        SizedBox(
          height: AppSize.h140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: forecast.dailyForecast.length,
            itemBuilder: (context, index) {
              final dayForecast = forecast.dailyForecast[index];
              return Container(
                width: AppSize.w90,
                margin: EdgeInsets.only(right: AppSize.w12),
                padding: EdgeInsets.all(AppSize.h8),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(AppRadius.small),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.shadow.withOpacity(0.1),
                      spreadRadius: AppSize.h1,
                      blurRadius: AppSize.h5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('E').format(dayForecast.dateTime),
                      style: getMediumTextStyle(
                        fontSize: AppFontSize.small,
                        color: AppColor.black,
                      ),
                    ),
                    SizedBox(height: AppSize.h4),
                    Image.network(
                      'https://openweathermap.org/img/wn/${dayForecast.icon}.png',
                      width: AppSize.w35,
                      height: AppSize.h35,
                    ),
                    SizedBox(height: AppSize.h4),
                    Text(
                      '${controller.convertTemperature(dayForecast.temperature).round()}°',
                      style: getLargeTextStyle(
                        fontSize: AppFontSize.medium,
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
