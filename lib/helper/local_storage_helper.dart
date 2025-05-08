import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageHelper {
  static Future<bool> setItem(String key, String val) async {
    final pref = await SharedPreferences.getInstance();
    return await pref.setString(key, val);
  }

  static Future<String?> getItem(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? '';
  }

  static Future<bool> removeItem(String key) async {
    final pref = await SharedPreferences.getInstance();
    return await pref.remove(key);
  }

  static clearAll() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
