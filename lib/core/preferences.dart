import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

String signLearnPrefKey = 'cudddleAppPreferencesLocalKey';

class Preferences {
  bool soundEnabled = true;
  bool vibrationEnabled = true;

  Preferences._internal();
  static final Preferences instance = Preferences._internal();

  factory Preferences() => instance;
  // Getters and Setters

  static toMap() {
    return {
      'soundEnabled': instance.soundEnabled,
      'vibrationEnabled': instance.vibrationEnabled,
    };
  }

  static fromMap(Map<String, dynamic>? map) {
    if (map != null && map.isNotEmpty) {
      instance.soundEnabled = map['soundEnabled'];
      instance.vibrationEnabled = map['vibrationEnabled'];
    } else {
      instance.soundEnabled = true;
      instance.vibrationEnabled = true;
    }
  }

  static Future<void> readState() async {
    final prefs = await SharedPreferences.getInstance();
    fromMap(json.decode(prefs.getString(signLearnPrefKey) ?? '{}'));
  }

  static Future<void> saveState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(signLearnPrefKey, json.encode(toMap()));
  }

  static Future<void> clearState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(signLearnPrefKey);
    await saveState(); // temporary change it later
  }
}
