import 'package:get/get.dart';
import 'package:travelapp/app/data/models/post.dart';

class PostDetailsController extends GetxController {
  final Post post = Get.arguments;
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  Future loadData() async {
    loading = true;
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
