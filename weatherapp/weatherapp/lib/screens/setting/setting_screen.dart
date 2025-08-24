import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/weather_controller.dart';
import '../../constants/app_color.dart';
import '../../constants/app_styles.dart';
import '../../constants/app_size_value.dart';
import '../../constants/app_fonts.dart';
import '../../widgets/custom_app_bar.dart';
import '../../constants/app_string.dart';
import '../../utils/dialog_utils.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final WeatherController weatherController = Get.find<WeatherController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.weatherLightBlue,
      appBar: CustomAppBar(
        title: AppStrings.settingsTitle,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.weatherBlue,
        titleColor: AppColor.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSize.h16),
        children: [
          _buildSettingSection(
            AppStrings.temperatureUnit,
            [
              _buildTemperatureUnitSetting(),
            ],
          ),
          SizedBox(height: AppSize.h24),
          _buildSettingSection(
            AppStrings.dataManagement,
            [
              _buildClearDataButton(),
            ],
          ),
          SizedBox(height: AppSize.h24),
          _buildSettingSection(
            AppStrings.about,
            [
              _buildAboutInfo(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingSection(String title, List<Widget> children) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(AppSize.h16),
            child: Text(
              title,
              style: getLargeTextStyle(
                fontSize: AppFontSize.xLarge,
                color: AppColor.weatherBlue,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTemperatureUnitSetting() {
    return Obx(() => ListTile(
          leading: Icon(Icons.thermostat, color: AppColor.weatherBlue),
          title: Text(AppStrings.temperatureUnit,
              style: getMediumTextStyle(
                  fontSize: AppFontSize.large, color: AppColor.black)),
          subtitle: Text(
            weatherController.temperatureUnit.value == AppStrings.celsiusUnit
                ? AppStrings.celsius
                : AppStrings.fahrenheit,
            style: getSmallTextStyle(
                fontSize: AppFontSize.medium, color: AppColor.grey),
          ),
          trailing: Switch(
            value: weatherController.temperatureUnit.value ==
                AppStrings.fahrenheitUnit,
            onChanged: (value) {
              weatherController.changeTemperatureUnit(
                value ? AppStrings.fahrenheitUnit : AppStrings.celsiusUnit,
              );
            },
            activeColor: AppColor.weatherBlue,
          ),
        ));
  }

  Widget _buildClearDataButton() {
    return ListTile(
      leading: Icon(Icons.delete_forever, color: AppColor.red),
      title: Text(AppStrings.clearAllData,
          style: getMediumTextStyle(
              fontSize: AppFontSize.large, color: AppColor.black)),
      subtitle: Text(AppStrings.removeAllFavoritesAndSettings,
          style: getSmallTextStyle(
              fontSize: AppFontSize.medium, color: AppColor.grey)),
      onTap: () {
        _showClearDataDialog();
      },
    );
  }

  Widget _buildAboutInfo() {
    return ListTile(
      leading: Icon(Icons.info, color: AppColor.weatherBlue),
      title: Text(AppStrings.weatherAppAbout,
          style: getMediumTextStyle(
              fontSize: AppFontSize.large, color: AppColor.black)),
      subtitle: Text('${AppStrings.version} ${AppStrings.appVersion}',
          style: getSmallTextStyle(
              fontSize: AppFontSize.medium, color: AppColor.grey)),
      onTap: () {
        _showAboutDialog();
      },
    );
  }

  void _showClearDataDialog() {
    showConfirmationDialog(
      title: AppStrings.clearAllData,
      subtitle: AppStrings.thisWillRemoveAllData,
      cancelText: AppStrings.cancel,
      deleteText: AppStrings.clear,
      onDelete: () async {
        //Get.back(); 
        await weatherController.clearAllData();
      },
      onClose: () => Get.back(),
    );
  }

  void _showAboutDialog() {
    showDefaultDialog(
      title: AppStrings.aboutWeatherApp,
      middleText: '''
${AppStrings.beautifulWeatherAppFeatures}

${AppStrings.currentWeatherBasedOnLocation}
${AppStrings.sevenDayWeatherForecast}
${AppStrings.searchForAnyCity}
${AppStrings.addRemoveFavoriteCities}
${AppStrings.temperatureUnitConversion}
${AppStrings.cleanAndModernUI}

${AppStrings.poweredByOpenWeatherAPI}
''',
      buttonText: AppStrings.ok,
    );
  }
}
