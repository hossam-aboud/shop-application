import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    print('the Instance of SharedPreferences is created Successfully');
  }

  static void setTokenUser({required String key, required String value}) {
    sharedPreferences.setString(key, value);
    print('the token ID saved in shared preferences');
  }

  static String? getTokenUser({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }

  static void setBoolean({
    required String key,
    required bool value,
  }) {
    sharedPreferences.setBool(key, value);
  }

  static bool? getBoolean({required String key}) {
    return sharedPreferences.getBool(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);

    return await sharedPreferences.setDouble(key, value);
  }

  static dynamic getSaveData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }
}
