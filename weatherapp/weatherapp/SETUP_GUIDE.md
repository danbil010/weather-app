# Weather App Setup Guide

This guide will help you set up and run the Weather App on your local machine.

## Prerequisites

- Flutter SDK (3.6.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

## Step 1: Clone and Navigate to Project

```bash
cd weatherapp
```

## Step 2: Get OpenWeather API Key

1. Visit [OpenWeather API](https://openweathermap.org/api)
2. Sign up for a free account
3. Go to your API keys section
4. Copy your API key

## Step 3: Configure API Key

1. Open `lib/constants/api_config.dart`
2. Replace `YOUR_API_KEY_HERE` with your actual API key:

```dart
static const String openWeatherApiKey = 'your_actual_api_key_here';
```

## Step 4: Install Dependencies

```bash
flutter pub get
```

## Step 5: Platform Setup

### Android Setup

Add these permissions to `android/app/src/main/AndroidManifest.xml` inside the `<manifest>` tag:

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

### iOS Setup

Add these keys to `ios/Runner/Info.plist` inside the `<dict>` tag:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs access to location to show weather for your current location.</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>This app needs access to location to show weather for your current location.</string>
```

## Step 6: Run the App

```bash
flutter run
```

## Troubleshooting

### Common Issues

1. **API Key Error**: Make sure you've replaced the API key in `api_config.dart`
2. **Location Permission Error**: Ensure you've added the required permissions
3. **Dependencies Error**: Run `flutter clean` then `flutter pub get`
4. **Build Error**: Make sure you're using Flutter 3.6.0 or higher

### Getting Help

If you encounter any issues:

1. Check the Flutter documentation
2. Verify your API key is working
3. Ensure all permissions are properly configured
4. Check the console for specific error messages

## Features to Test

Once the app is running, test these features:

1. **Current Location Weather**: Tap the location button
2. **City Search**: Search for any city name
3. **Favorites**: Add cities to favorites
4. **Temperature Units**: Toggle between Celsius and Fahrenheit
5. **7-Day Forecast**: View the forecast section

## Next Steps

- Customize the UI colors and themes
- Add more weather details
- Implement push notifications
- Add weather alerts

---

**Note**: The app requires an active internet connection to fetch weather data from the OpenWeather API.
