// ignore_for_file: prefer_final_fields
import 'package:get/get.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';
import 'package:travelapp/app/data/models/user.dart';

class HomeController extends GetxController {
  RxList<String> _addressList =
      <String>['Nha Trang', 'Đà Lạt', 'Đà Nẵng', 'Hội An'].obs;
  List<String> get addressList => _addressList;
  set addressList(value) => _addressList.value = value;

  RxString _currentAddress = "Nha Trang".obs;
  String get currentAddress => _currentAddress.value;
  set currentAddress(value) => _currentAddress.value = value;

  Rx<DateTime> _selectedDate = DateTime.now().obs;
  DateTime get selectedDate => _selectedDate.value;
  set selectedDate(value) => _selectedDate.value = value;

  Future loadData() async {
    User user = await StorageHelper.getUserFromStorage();
    print(user.email);
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
