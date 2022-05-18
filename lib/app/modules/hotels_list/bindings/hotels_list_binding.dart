import 'package:get/get.dart';

import '../controllers/hotels_list_controller.dart';

class HotelsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotelsListController>(
      () => HotelsListController(),
    );
  }
}
