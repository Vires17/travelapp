import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travelapp/app/data/constants.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';
import 'package:travelapp/app/data/models/user.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class UserRepository {
  static Future<String> loginUser(String email, String password) async {
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
    final result = jsonDecode(response.body);
    final dynamic error = result['error'];
    if (error != null) {
      return error['message'];
    } else {
      Map<String, dynamic> user = result['user'];
      StorageHelper.saveUserToStorage(user);
      return "success";
    }
  }

  static Future<String> createUser(String name, email, phone, password) async {
    var url = Uri.parse(API_URL + '/api/users/');
    var token = APP_TOKEN;
    var body = {
      'username': name,
      'email': email,
      'phone_number': phone,
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
    // get error from response
    final result = jsonDecode(response.body);
    final dynamic error = result['error'];
    if (error != null) {
      return error['message'];
    } else {
      return "success";
    }
  }
}
