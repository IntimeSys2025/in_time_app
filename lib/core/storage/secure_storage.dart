import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveBoolValue({required String key,required bool value}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}
Future<bool> getBoolValue({required String key, bool defaultValue = false}) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key) ?? defaultValue;
}