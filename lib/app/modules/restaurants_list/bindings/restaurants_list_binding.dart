import 'package:get/get.dart';

import '../controllers/restaurants_list_controller.dart';

class RestaurantsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantsListController>(
      () => RestaurantsListController(),
    );
  }
}
