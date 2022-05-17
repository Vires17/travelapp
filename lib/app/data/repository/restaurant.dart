import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travelapp/app/data/constants.dart';
import 'package:travelapp/app/data/models/restaurant.dart';

class RestaurantRepository {
  static Future<List<Restaurant>> getRestaurants(
      {int? destinationId, String? search}) async {
    var queryParams = {
      'populate': 'cover_image, album, destination',
    };
    if (destinationId != null) {
      queryParams = {
        ...queryParams,
        'filters[destination][id][\$eq]': destinationId.toString(),
      };
    }
    if (search != null) {
      queryParams = {
        ...queryParams,
        'filters[name][\$containsi]': search,
      };
    }
    var url = Uri.https(API_URL, '/api/restaurants/', queryParams);
    var token = APP_TOKEN;
    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(url, headers: header);
    List<Restaurant> restaurants = List<Restaurant>.empty(growable: true);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      List<dynamic> data = result['data'];
      for (int i = 0; i < data.length; i++) {
        dynamic tmpRestaurant = data[i];
        Restaurant restaurant =
            Restaurant.fromJson(tmpRestaurant['attributes']);
        restaurant.id = tmpRestaurant['id'];
        restaurants.add(restaurant);
      }
      print(restaurants);
      return restaurants;
    } else {
      print("RONG");
      return restaurants;
    }
  }
}
