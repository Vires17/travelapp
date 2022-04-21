import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travelapp/app/data/constants.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';
import 'package:travelapp/app/data/models/destination.dart';
import 'package:travelapp/app/data/models/user.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class DestinationRepository {
  static Future<List<Destination>> getDestinations() async {
    var url =
        Uri.parse(API_URL + '/api/destinations/?populate=cover_image, album');
    var token = APP_TOKEN;
    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(url, headers: header);
    List<Destination> destinations = List<Destination>.empty(growable: true);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      List<dynamic> data = result['data'];
      for (int i = 0; i < data.length; i++) {
        dynamic tmp_des = data[i];
        Destination destination = Destination.fromJson(tmp_des['attributes']);
        destination.id = tmp_des['id'];
        destinations.add(destination);
      }
      return destinations;
    } else {
      return destinations;
    }
  }
}
