import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class StorageService {
  static const String _settingsKey = 'weather_settings';
  static const String _favoritesKey = 'favorite_cities';
  static Database? _database;

  // Initialize database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'weather_app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE favorites(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            cityName TEXT NOT NULL,
            country TEXT NOT NULL,
            lat REAL NOT NULL,
            lon REAL NOT NULL,
            addedAt TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // Settings methods
  Future<Map<String, dynamic>> getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final settingsJson = prefs.getString(_settingsKey);
    if (settingsJson != null) {
      return json.decode(settingsJson);
    }
    return {
      'temperatureUnit': 'celsius', 
      'lastLocation': null,
    };
  }

  Future<void> saveSettings(Map<String, dynamic> settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_settingsKey, json.encode(settings));
  }

  Future<String> getTemperatureUnit() async {
    final settings = await getSettings();
    return settings['temperatureUnit'] ?? 'celsius';
  }

  Future<void> setTemperatureUnit(String unit) async {
    final settings = await getSettings();
    settings['temperatureUnit'] = unit;
    await saveSettings(settings);
  }

  Future<Map<String, dynamic>?> getLastLocation() async {
    final settings = await getSettings();
    return settings['lastLocation'];
  }

  Future<void> saveLastLocation(double lat, double lon, String cityName) async {
    final settings = await getSettings();
    settings['lastLocation'] = {
      'lat': lat,
      'lon': lon,
      'cityName': cityName,
    };
    await saveSettings(settings);
  }

  // Favorites methods
  Future<List<Map<String, dynamic>>> getFavoriteCities() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');
    return maps;
  }

  Future<void> addFavoriteCity(String cityName, String country, double lat, double lon) async {
    final db = await database;
    await db.insert('favorites', {
      'cityName': cityName,
      'country': country,
      'lat': lat,
      'lon': lon,
      'addedAt': DateTime.now().toIso8601String(),
    });
  }

  Future<void> removeFavoriteCity(String cityName) async {
    final db = await database;
    await db.delete(
      'favorites',
      where: 'cityName = ?',
      whereArgs: [cityName],
    );
  }

  Future<bool> isFavoriteCity(String cityName) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'favorites',
      where: 'cityName = ?',
      whereArgs: [cityName],
    );
    return maps.isNotEmpty;
  }

  // Clear all data
  Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
    final db = await database;
    await db.delete('favorites');
  }
}
