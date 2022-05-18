import 'package:get/get.dart';

import '../controllers/destination_list_controller.dart';

class DestinationListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DestinationListController>(
      () => DestinationListController(),
    );
  }
}
