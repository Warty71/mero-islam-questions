import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  static const _keyLastAnswer = "Last";
  static const _keyFavorites = "Favorites";
  static const _keyAskedDate = "Today";


  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setLastAnswer(List<String> lastAnswer) async =>
      await _preferences?.setStringList(_keyLastAnswer, lastAnswer);

  static Future setFavorites(List<String> favorites) async =>
      await _preferences?.setStringList(_keyFavorites, favorites);

  static Future setAskedDate(String askedDate) async =>
    await _preferences!.setString(_keyAskedDate, askedDate);

  static List<String>? getLastAnswer() => _preferences?.getStringList(_keyLastAnswer);
  static List<String>? getFavorites() => _preferences?.getStringList(_keyFavorites);
  static String? getAskedDate() => _preferences?.getString(_keyAskedDate);

}