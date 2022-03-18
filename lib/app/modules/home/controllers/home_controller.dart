// ignore_for_file: prefer_final_fields
import 'package:get/get.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';
import 'package:travelapp/app/data/models/destination.dart';
import 'package:travelapp/app/data/models/user.dart';
import 'package:travelapp/app/data/repository/destination.dart';

class HomeController extends GetxController {
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  RxList<Destination> _addressList =
      List<Destination>.empty(growable: true).obs;
  List<Destination> get addressList => _addressList;
  set addressList(value) => _addressList.value = value;

  Rx<Destination> _currentAddress = Destination(id: -1, name: "").obs;
  Destination get currentAddress => _currentAddress.value;
  set currentAddress(value) => _currentAddress.value = value;

  Rx<DateTime> _selectedDate = DateTime.now().obs;
  DateTime get selectedDate => _selectedDate.value;
  set selectedDate(value) => _selectedDate.value = value;

  Future loadData() async {
    loading = true;
    addressList = await DestinationRepository.getDestinations();
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
