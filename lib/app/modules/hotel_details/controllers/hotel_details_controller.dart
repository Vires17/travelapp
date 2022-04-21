import 'package:get/get.dart';
import 'package:travelapp/app/data/models/hotel.dart';
import 'package:travelapp/app/data/repository/hotel.dart';

class HotelDetailsController extends GetxController {
  final Hotel hotel = Get.arguments;
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  Future loadData() async {
    loading = true;
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
