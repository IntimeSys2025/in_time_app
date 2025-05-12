import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveBoolValue({required String key, required bool value}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}

Future<bool> getBoolValue(
    {required String key, bool defaultValue = false}) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key) ?? defaultValue;
}

Future<void> saveStringValue(
    {required String key, required String value}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

Future<String?> getStringValue({required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

// Future<void> saveDoubleValue(
//     {required String key, required double value}) async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setDouble(key, value);
// }
//
// Future<double?> getDoubleValue({required String key}) async {
//   final prefs = await SharedPreferences.getInstance();
//   return prefs.getDouble(key);
// }
