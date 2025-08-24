class ApiConfig {
  // OpenWeather API Configuration
  static const String openWeatherBaseUrl = 'https://api.openweathermap.org/data/2.5';
  
  // Get your free API key from: https://openweathermap.org/api
  static const String openWeatherApiKey = '781e5fea17518e513b30125688fabcb5';
  
  // API Endpoints
  static const String currentWeatherEndpoint = '/weather';
  static const String forecastEndpoint = '/forecast';
  
  // Default units (metric = Celsius, imperial = Fahrenheit)
  static const String defaultUnits = 'metric';
  
  // API Response timeout (in seconds)
  static const int timeoutSeconds = 30;
  
  // Weather icon base URL
  static const String weatherIconBaseUrl = 'https://openweathermap.org/img/wn';
  
  // Get full API URL for current weather
  static String getCurrentWeatherUrl(double lat, double lon) {
    return '$openWeatherBaseUrl$currentWeatherEndpoint?lat=$lat&lon=$lon&appid=$openWeatherApiKey&units=$defaultUnits';
  }
  
  // Get full API URL for current weather by city
  static String getCurrentWeatherByCityUrl(String cityName) {
    return '$openWeatherBaseUrl$currentWeatherEndpoint?q=$cityName&appid=$openWeatherApiKey&units=$defaultUnits';
  }
  
  // Get full API URL for forecast
  static String getForecastUrl(double lat, double lon) {
    return '$openWeatherBaseUrl$forecastEndpoint?lat=$lat&lon=$lon&appid=$openWeatherApiKey&units=$defaultUnits';
  }
  
  // Get full API URL for forecast by city
  static String getForecastByCityUrl(String cityName) {
    return '$openWeatherBaseUrl$forecastEndpoint?q=$cityName&appid=$openWeatherApiKey&units=$defaultUnits';
  }
  
  // Get weather icon URL
  static String getWeatherIconUrl(String iconCode, {int size = 2}) {
    return '$weatherIconBaseUrl/$iconCode@${size}x.png';
  }
}
