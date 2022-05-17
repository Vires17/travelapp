// ignore_for_file: prefer_final_fields
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';
import 'package:travelapp/app/data/models/destination.dart';
import 'package:travelapp/app/data/models/hotel.dart';
import 'package:travelapp/app/data/models/post.dart';
import 'package:travelapp/app/data/models/restaurant.dart';
import 'package:travelapp/app/data/models/user.dart';
import 'package:travelapp/app/data/repository/destination.dart';
import 'package:travelapp/app/data/repository/hotel.dart';
import 'package:travelapp/app/data/repository/post.dart';
import 'package:travelapp/app/data/repository/restaurant.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var search = '';
  final GlobalKey<FormState> searchFormKey = new GlobalKey<FormState>();

  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  Rx<User> _currentUser = User().obs;
  User get currentUser => _currentUser.value;
  set currentUser(value) => _currentUser.value = value;

  RxList<Hotel> _hotelList = List<Hotel>.empty(growable: true).obs;
  List<Hotel> get hotelList => _hotelList;
  set hotelList(value) => _hotelList.value = value;

  RxList<Restaurant> _restaurantList =
      List<Restaurant>.empty(growable: true).obs;
  List<Restaurant> get restaurantList => _restaurantList;
  set restaurantList(value) => _restaurantList.value = value;

  RxList<Post> _postList = List<Post>.empty(growable: true).obs;
  List<Post> get postList => _postList;
  set postList(value) => _postList.value = value;

  RxList<Destination> _destinationList =
      List<Destination>.empty(growable: true).obs;
  List<Destination> get destinationList => _destinationList;
  set destinationList(value) => _destinationList.value = value;

  Future loadData() async {
    loading = true;
    currentUser = await StorageHelper.getUserFromStorage();
    hotelList = await HotelRepository.getHotels(limit: 4);
    restaurantList = await RestaurantRepository.getRestaurants(limit: 4);
    postList = await PostRepository.getPosts(limit: 3);
    destinationList = await DestinationRepository.getDestinations(limit: 5);
    // currentAddress = addressList[0];
    loading = false;
  }

  void searching() async {
    if (search.isNotEmpty) {
      Get.toNamed(Routes.SEARCH, arguments: search);
    }
  }

  @override
  void onInit() async {
    await loadData();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
