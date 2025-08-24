import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../models/weather_model.dart';
import '../constants/api_config.dart';

class WeatherApiService {

  // Get current weather by coordinates
  Future<WeatherModel> getCurrentWeather(double lat, double lon) async {
    final response = await http.get(
      Uri.parse(ApiConfig.getCurrentWeatherUrl(lat, lon)),
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load current weather');
    }
  }

  // Get current weather by city name
  Future<WeatherModel> getCurrentWeatherByCity(String cityName) async {
    final response = await http.get(
      Uri.parse(ApiConfig.getCurrentWeatherByCityUrl(cityName)),
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather for $cityName');
    }
  }

  // Get 7-day forecast by coordinates
  Future<ForecastModel> getForecast(double lat, double lon) async {
    final response = await http.get(
      Uri.parse(ApiConfig.getForecastUrl(lat, lon)),
    );

    if (response.statusCode == 200) {
      return ForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load forecast');
    }
  }

  // Get 7-day forecast by city name
  Future<ForecastModel> getForecastByCity(String cityName) async {
    final response = await http.get(
      Uri.parse(ApiConfig.getForecastByCityUrl(cityName)),
    );

    if (response.statusCode == 200) {
      return ForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load forecast for $cityName');
    }
  }

  // Get current location
  Future<Position> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permanently denied');
      }

      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );
    } catch (e) {
      if (e is TimeoutException) {
        throw Exception('Location request timed out. Please try again.');
      }
      rethrow;
    }
  }

  // Get city name from coordinates
  Future<String> getCityNameFromCoordinates(double lat, double lon) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      if (placemarks.isNotEmpty) {
        return placemarks.first.locality ?? 'Unknown City';
      }
      return 'Unknown City';
    } catch (e) {
      return 'Unknown City';
    }
  }

  // Search cities by name
  Future<List<String>> searchCities(String query) async {
    if (query.length < 3) return [];

    try {
      List<Location> locations = await locationFromAddress(query);
      List<String> cities = [];
      
      for (var location in locations.take(5)) {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          location.latitude,
          location.longitude,
        );
        if (placemarks.isNotEmpty) {
          String cityName = placemarks.first.locality ?? '';
          if (cityName.isNotEmpty && !cities.contains(cityName)) {
            cities.add(cityName);
          }
        }
      }
      
      return cities;
    } catch (e) {
      return [];
    }
  }
}
