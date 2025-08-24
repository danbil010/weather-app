# Weather App

A beautiful and feature-rich weather application built with Flutter and GetX, providing real-time weather information and forecasts.

## Features

- 🌤️ **Current Weather**: Display current weather based on user's location
- 📅 **7-Day Forecast**: View detailed weather forecasts for the next 7 days
- 🔍 **City Search**: Search for weather in any city worldwide
- ❤️ **Favorites**: Add and manage favorite cities
- 🌡️ **Temperature Units**: Switch between Celsius and Fahrenheit
- 📱 **Modern UI**: Clean and intuitive user interface
- 💾 **Local Storage**: Persist favorites and settings locally

## Technical Requirements

- **API**: OpenWeather API for weather data
- **State Management**: GetX for reactive state management
- **Local Storage**: SQLite for favorites, SharedPreferences for settings
- **Location Services**: Geolocator for current location
- **Architecture**: Clean architecture with separation of concerns

## Setup Instructions

### 1. Prerequisites

- Flutter SDK (3.6.0 or higher)
- Dart SDK
- Android Studio / VS Code
- OpenWeather API key

### 2. Get OpenWeather API Key

1. Visit [OpenWeather API](https://openweathermap.org/api)
2. Sign up for a free account
3. Get your API key from the dashboard
4. Replace `YOUR_API_KEY_HERE` in `lib/api/weather_api_service.dart`

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Platform Setup

#### Android
Add location permissions to `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

#### iOS
Add location permissions to `ios/Runner/Info.plist`:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs access to location to show weather for your current location.</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>This app needs access to location to show weather for your current location.</string>
```

### 5. Run the App

```bash
flutter run
```

## Project Structure

```
lib/
├── api/
│   └── weather_api_service.dart    # OpenWeather API integration
├── controller/
│   └── weather_controller.dart     # GetX controller for state management
├── local/
│   └── storage_service.dart        # Local storage (SQLite + SharedPreferences)
├── models/
│   └── weather_model.dart          # Data models
├── screens/
│   ├── dashboard_screen.dart       # Main navigation screen
│   ├── setting/
│   │   └── setting_screen.dart     # Settings screen
│   └── weather/
│       ├── weather_screen.dart     # Main weather screen
│       └── favorites_screen.dart   # Favorites management
└── widgets/
    └── custom_bottom_nav_bar.dart  # Custom bottom navigation
```

## Architecture

The app follows clean architecture principles:

- **Presentation Layer**: UI screens and widgets
- **Business Logic Layer**: GetX controllers
- **Data Layer**: API services and local storage
- **Domain Layer**: Models and entities

## Key Components

### WeatherController
Manages all weather-related state and operations:
- Current weather data
- Forecast data
- Favorite cities
- Temperature unit settings
- Error handling

### WeatherApiService
Handles all API calls to OpenWeather:
- Current weather by coordinates/city
- 7-day forecast
- Location services
- City search

### StorageService
Manages local data persistence:
- SQLite database for favorites
- SharedPreferences for settings
- Temperature unit preferences

## API Usage

The app uses the following OpenWeather API endpoints:
- `GET /weather` - Current weather data
- `GET /forecast` - 5-day forecast (3-hour intervals)

## Features in Detail

### Current Weather
- Temperature (current and feels like)
- Weather description and icon
- Humidity, wind speed, pressure
- Location-based weather

### 7-Day Forecast
- Daily weather predictions
- Temperature ranges
- Weather conditions
- Interactive horizontal scroll

### City Search
- Real-time city search
- Auto-complete suggestions
- Error handling for invalid cities

### Favorites Management
- Add cities to favorites
- Remove from favorites
- Persistent storage
- Quick access to favorite cities

### Settings
- Temperature unit toggle (Celsius/Fahrenheit)
- Data management
- About information

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.7.2                    # State management
  http: ^1.1.0                   # API calls
  geolocator: ^10.1.0            # Location services
  geocoding: ^2.1.1              # Geocoding
  shared_preferences: ^2.2.2     # Settings storage
  sqflite: ^2.3.0                # Database
  path: ^1.8.3                   # File paths
  intl: ^0.18.1                  # Date formatting
  weather_icons: ^3.0.0          # Weather icons
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Support

For support and questions, please open an issue on GitHub.

---

**Note**: Make sure to replace the API key in the code before running the application. The app requires an active internet connection to fetch weather data.
