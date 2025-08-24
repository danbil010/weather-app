import 'package:get/get.dart';
import 'package:weatherapp/utils/dialog_utils.dart';
import '../models/weather_model.dart';
import '../api/weather_api_service.dart';
import '../local/storage_service.dart';
import '../constants/app_string.dart';

class WeatherController extends GetxController {
  final WeatherApiService _apiService = WeatherApiService();
  final StorageService _storageService = StorageService();

  // Observable variables
  final Rx<WeatherModel?> currentWeather = Rx<WeatherModel?>(null);
  final Rx<ForecastModel?> forecast = Rx<ForecastModel?>(null);
  final RxString currentCity = ''.obs;
  final RxString temperatureUnit = AppStrings.celsiusUnit.obs;
  final RxList<Map<String, dynamic>> favoriteCities = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxBool isCurrentCityFavorite = false.obs;
  final RxInt currentTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSettings();
    _loadFavorites();
  }

  // Load settings from storage
  Future<void> _loadSettings() async {
    try {
      temperatureUnit.value = await _storageService.getTemperatureUnit();
      final lastLocation = await _storageService.getLastLocation();
      if (lastLocation != null) {
        currentCity.value = lastLocation['cityName'];
        await getCurrentWeatherByLocation(
          lastLocation['lat'],
          lastLocation['lon'],
        );
      }
    } catch (e) {
      errorMessage.value = AppStrings.failedToLoadSettings;
    }
  }

  // Load favorite cities from storage
  Future<void> _loadFavorites() async {
    try {
      final favorites = await _storageService.getFavoriteCities();
      favoriteCities.assignAll(favorites);
    } catch (e) {
      errorMessage.value = AppStrings.failedToLoadFavorites;
    }
  }

  // Update favorite status for current city
  Future<void> _updateFavoriteStatus(String cityName) async {
    try {
      final isFavorite = await _storageService.isFavoriteCity(cityName);
      isCurrentCityFavorite.value = isFavorite;
    } catch (e) {
      isCurrentCityFavorite.value = false;
    }
  }

  // Get current weather by coordinates
  Future<void> getCurrentWeatherByLocation(double lat, double lon) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final weather = await _apiService.getCurrentWeather(lat, lon);
      currentWeather.value = weather;

     
      final cityName = await _apiService.getCityNameFromCoordinates(lat, lon);
      currentCity.value = cityName;
      await _storageService.saveLastLocation(lat, lon, cityName);

      
      await _updateFavoriteStatus(cityName);

     
      await getForecastByLocation(lat, lon);
    } catch (e) {
      errorMessage.value = AppStrings.failedToGetWeatherData;
    } finally {
      isLoading.value = false;
    }
  }

  // Get current weather by city name
  Future<void> getCurrentWeatherByCity(String cityName) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final weather = await _apiService.getCurrentWeatherByCity(cityName);
      currentWeather.value = weather;
      currentCity.value = cityName;

      
      await _storageService.saveLastLocation(
        weather.dateTime.millisecondsSinceEpoch.toDouble(),
        weather.dateTime.millisecondsSinceEpoch.toDouble(),
        cityName,
      );

      
      await _updateFavoriteStatus(cityName);

     
      await getForecastByCity(cityName);
    } catch (e) {
      errorMessage.value = '${AppStrings.failedToGetWeatherForCity} $cityName';
    } finally {
      isLoading.value = false;
    }
  }

  // Get forecast by coordinates
  Future<void> getForecastByLocation(double lat, double lon) async {
    try {
      final forecastData = await _apiService.getForecast(lat, lon);
      forecast.value = forecastData;
    } catch (e) {
      errorMessage.value = AppStrings.failedToGetForecast;
    }
  }

  // Get forecast by city name
  Future<void> getForecastByCity(String cityName) async {
    try {
      final forecastData = await _apiService.getForecastByCity(cityName);
      forecast.value = forecastData;
    } catch (e) {
      errorMessage.value = '${AppStrings.failedToGetForecastForCity} $cityName';
    }
  }

  // Get current location weather
  Future<void> getCurrentLocationWeather() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final position = await _apiService.getCurrentLocation();
      await getCurrentWeatherByLocation(position.latitude, position.longitude);
    } catch (e) {
      if (e.toString().contains('Location services are disabled')) {
        errorMessage.value = AppStrings.pleaseEnableLocationServices;
      } else if (e.toString().contains('Location permissions are denied')) {
        errorMessage.value = AppStrings.pleaseGrantLocationPermission;
      } else if (e.toString().contains('Location permissions are permanently denied')) {
        errorMessage.value = AppStrings.locationPermissionPermanentlyDenied;
      } else {
        errorMessage.value = '${AppStrings.failedToGetCurrentLocation}: ${e.toString()}';
      }
    } finally {
      isLoading.value = false;
    }
  }

  // Search cities
  Future<List<String>> searchCities(String query) async {
    try {
      return await _apiService.searchCities(query);
    } catch (e) {
      return [];
    }
  }

  // Add city to favorites
  Future<void> addToFavorites(String cityName, double lat, double lon) async {
    try {
      await _storageService.addFavoriteCity(cityName, '', lat, lon);
      await _loadFavorites();
      if (currentCity.value == cityName) {
        isCurrentCityFavorite.value = true;
      }
    } catch (e) {
      errorMessage.value = AppStrings.failedToAddToFavorites;
    }
  }

  // Remove city from favorites
  Future<void> removeFromFavorites(String cityName) async {
    try {
      await _storageService.removeFavoriteCity(cityName);
      await _loadFavorites();
      if (currentCity.value == cityName) {
        isCurrentCityFavorite.value = false;
      }
    } catch (e) {
      errorMessage.value = AppStrings.failedToRemoveFromFavorites;
    }
  }

  // Check if city is favorite
  Future<bool> isFavoriteCity(String cityName) async {
    try {
      return await _storageService.isFavoriteCity(cityName);
    } catch (e) {
      return false;
    }
  }

  // Change temperature unit
  Future<void> changeTemperatureUnit(String unit) async {
    try {
      await _storageService.setTemperatureUnit(unit);
      temperatureUnit.value = unit;
    } catch (e) {
      errorMessage.value = AppStrings.failedToChangeTemperatureUnit;
    }
  }

  // Convert temperature based on unit
  double convertTemperature(double temperature) {
    if (temperatureUnit.value == AppStrings.fahrenheitUnit) {
      return (temperature * 9 / 5) + 32;
    }
    return temperature;
  }

  // Get temperature unit symbol
  String getTemperatureSymbol() {
    return temperatureUnit.value == AppStrings.fahrenheitUnit ? '°F' : '°C';
  }

  // Clear error message
  void clearError() {
    errorMessage.value = '';
  }

  // Switch to weather tab
  void switchToWeatherTab() {
    currentTabIndex.value = 0;
  }

  // Clear all data (favorites and settings)
  Future<void> clearAllData() async {
    try {
      // Clear all data using storage service
      await _storageService.clearAllData();
      
      
      favoriteCities.clear();
      temperatureUnit.value = AppStrings.celsiusUnit;
      
      
      currentWeather.value = null;
      forecast.value = null;
      currentCity.value = '';
      isCurrentCityFavorite.value = false;
      
      // Clear error messages
      errorMessage.value = '';
      showSuccessDialog(
        title: AppStrings.success,
        middleText: 'All data has been cleared successfully',
        buttonText: AppStrings.ok,
      );
     
    } catch (e) {
      errorMessage.value = 'Failed to clear data: ${e.toString()}';
      showErrorDialog(
        title: AppStrings.error,
        middleText: 'Failed to clear data',
        buttonText: AppStrings.ok,
      );
     
    }
  }
}
