import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter/material.dart' as material;
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorage {
  // static const _key = 'secure_storage_key';
  // static final _encrypter = Encrypter(AES(Key.fromSecureRandom(32)));
  //
  // static Future<void> saveToken(String token) async {
  //   final encrypted = _encrypter.encrypt(token);
  //   final prefs = await SharedPreferences.getInstance();
  //   material.debugPrint('Encrypted token: ${encrypted.base64}');
  //   await prefs.setString('user_token', encrypted.base64);
  // }
  //
  // static Future<String?> getToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final encrypted = prefs.getString('user_token');
  //   if (encrypted == null) return null;
  //   return _encrypter.decrypt64(encrypted);
  // }
  //
  static const _storage = FlutterSecureStorage();
  static Future<void> saveToken(String token)async{
    debugPrint('token: $token');
    await _storage.write(key: 'user_token', value: token);
  }

  static Future<String?> getToken()async{
    return await _storage.read(key: 'user_token');
  }

}
