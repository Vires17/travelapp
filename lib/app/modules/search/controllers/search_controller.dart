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

class SearchController extends GetxController {
  String search = Get.arguments;
  final GlobalKey<FormState> searchFormKey = new GlobalKey<FormState>();
  TextEditingController searchTextController = new TextEditingController();

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

  Future loadData() async {
    loading = true;
    searchTextController.text = search;
    currentUser = await StorageHelper.getUserFromStorage();
    hotelList = await HotelRepository.getHotels(search: search);
    restaurantList = await RestaurantRepository.getRestaurants(search: search);
    postList = await PostRepository.getPosts(search: search);
    // currentAddress = addressList[0];
    loading = false;
  }

  void searching() async {
    await loadData();
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
