class WeatherModel {
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final String description;
  final String icon;
  final int pressure;
  final int visibility;
  final DateTime dateTime;

  WeatherModel({
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.description,
    required this.icon,
    required this.pressure,
    required this.visibility,
    required this.dateTime,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: (json['main']['temp'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      humidity: json['main']['humidity'] as int,
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      description: json['weather'][0]['description'] as String,
      icon: json['weather'][0]['icon'] as String,
      pressure: json['main']['pressure'] as int,
      visibility: json['visibility'] as int,
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'feelsLike': feelsLike,
      'humidity': humidity,
      'windSpeed': windSpeed,
      'description': description,
      'icon': icon,
      'pressure': pressure,
      'visibility': visibility,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }
}

class ForecastModel {
  final List<WeatherModel> dailyForecast;

  ForecastModel({required this.dailyForecast});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    List<WeatherModel> forecasts = [];
    
    for (var item in json['list']) {
      forecasts.add(WeatherModel.fromJson(item));
    }

    return ForecastModel(dailyForecast: forecasts);
  }
}

class LocationModel {
  final String name;
  final String country;
  final double lat;
  final double lon;

  LocationModel({
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'] as String,
      country: json['sys']['country'] as String,
      lat: (json['coord']['lat'] as num).toDouble(),
      lon: (json['coord']['lon'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country': country,
      'lat': lat,
      'lon': lon,
    };
  }
}
