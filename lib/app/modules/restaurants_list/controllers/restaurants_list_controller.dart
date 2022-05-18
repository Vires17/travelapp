import 'package:get/get.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';
import 'package:travelapp/app/data/models/restaurant.dart';
import 'package:travelapp/app/data/models/user.dart';
import 'package:travelapp/app/data/repository/restaurant.dart';

class RestaurantsListController extends GetxController {
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  Rx<User> _currentUser = User().obs;
  User get currentUser => _currentUser.value;
  set currentUser(value) => _currentUser.value = value;

  RxList<Restaurant> _restaurantList =
      List<Restaurant>.empty(growable: true).obs;
  List<Restaurant> get restaurantList => _restaurantList;
  set restaurantList(value) => _restaurantList.value = value;

  Future loadData() async {
    loading = true;
    currentUser = await StorageHelper.getUserFromStorage();
    restaurantList = await RestaurantRepository.getRestaurants();
    // currentAddress = addressList[0];
    loading = false;
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
