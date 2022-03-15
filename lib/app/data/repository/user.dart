import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travelapp/app/data/constants.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';
import 'package:travelapp/app/data/models/user.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class UserRepository {
  static Future<bool> loginUser(String email, String password) async {
    var url = Uri.parse(API_URL + '/api/auth/local/');
    var token = APP_TOKEN;
    var body = {
      'identifier': email,
      'password': password,
    };
    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var response =
        await http.post(url, body: json.encode(body), headers: header);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final jwt = result['jwt'];
      Map<String, dynamic> user = result['user'];
      StorageHelper.saveUserToStorage(user);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> createUser(String name, email, phone, password) async {
    var url = Uri.parse(API_URL + '/api/users/');
    var token = APP_TOKEN;
    var body = {
      'username': name,
      'email': email,
      'phone': phone,
      'password': password,
      'confirmed': true
    };
    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response =
        await http.post(url, body: json.encode(body), headers: header);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
