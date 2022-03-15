import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp/app/data/models/user.dart';

class StorageHelper {
  static Future<bool> saveUserToStorage(Map<String, dynamic> user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userStore = jsonEncode(user);
    return await prefs.setString('user', userStore);
  }

  static Future<User> getUserFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(prefs.getString('user') ?? "");
    return User.fromJson(userMap);
  }

  static Future<void> clearAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  static Future<bool> checkExistsKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString('user');
    return user != null;
  }
}
