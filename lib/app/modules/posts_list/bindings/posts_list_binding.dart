import 'package:get/get.dart';

import '../controllers/posts_list_controller.dart';

class PostsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostsListController>(
      () => PostsListController(),
    );
  }
}
