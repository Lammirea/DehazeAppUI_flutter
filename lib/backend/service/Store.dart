import 'package:shared_preferences/shared_preferences.dart';

class Store{
  const Store._();

  static const String _tokenKey = "access_token";

  static Future<void> setToken(String access_token) async{
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString(_tokenKey, access_token);
  }

  static Future<String?> getToken() async{
    final preferences = await SharedPreferences.getInstance();

    return preferences.getString(_tokenKey);
  }

  static Future<void> clear() async{
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}