import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences prefs;

  SharedPreferencesService(this.prefs);

  String? get getLastWeatherData => prefs.getString('lastWeatherData');

  String? get getLastForecastData => prefs.getString('lastWeatherData');

  String? get getUserTheme => prefs.getString('selectedTheme');

  Future<bool> saveWeatherData(String weatherData) async {
    try {
      return await prefs.setString('lastWeatherData', weatherData);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<bool> saveForecastData(List<String> lastForecastData) async {
    try {
      return await prefs.setStringList('lastForecastData', lastForecastData);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<bool> setPreferredTheme(String theme) async {
    try {
      return await prefs.setString('selectedTheme', theme);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}