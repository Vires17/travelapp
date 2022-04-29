import 'package:get/get.dart';
import 'package:travelapp/app/data/models/restaurant.dart';
import 'package:travelapp/app/data/repository/restaurant.dart';

class RestaurantDetailsController extends GetxController {
  final Restaurant restaurant = Get.arguments;
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  RxList<Restaurant> _relatedRestaurantList =
      List<Restaurant>.empty(growable: true).obs;
  List<Restaurant> get relatedRestaurantList => _relatedRestaurantList;
  set relatedRestaurantList(value) => _relatedRestaurantList.value = value;

  Future loadData() async {
    loading = true;
    relatedRestaurantList =
        await RestaurantRepository.getRestaurants(restaurant.destination!.id);
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
