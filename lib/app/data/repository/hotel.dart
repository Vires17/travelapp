import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travelapp/app/data/constants.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';
import 'package:travelapp/app/data/models/destination.dart';
import 'package:travelapp/app/data/models/hotel.dart';
import 'package:travelapp/app/data/models/user.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class HotelRepository {
  static Future<List<Hotel>> getHotels([int? destinationId]) async {
    var queryParams = {
      'populate': 'cover_image, album, destination',
    };
    if (destinationId != null) {
      queryParams = {
        ...queryParams,
        'filters[destination][id][\$eq]': destinationId.toString(),
      };
    }
    var url = Uri.https(API_URL, '/api/hotels/', queryParams);
    var token = APP_TOKEN;
    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(url, headers: header);
    List<Hotel> hotels = List<Hotel>.empty(growable: true);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      List<dynamic> data = result['data'];
      for (int i = 0; i < data.length; i++) {
        dynamic tmpHotel = data[i];
        Hotel hotel = Hotel.fromJson(tmpHotel['attributes']);
        hotel.id = tmpHotel['id'];
        hotels.add(hotel);
      }
      print(hotels);
      return hotels;
    } else {
      print("RONG");
      return hotels;
    }
  }
}
