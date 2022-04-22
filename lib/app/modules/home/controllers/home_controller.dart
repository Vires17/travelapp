// ignore_for_file: prefer_final_fields
import 'package:get/get.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';
import 'package:travelapp/app/data/models/destination.dart';
import 'package:travelapp/app/data/models/hotel.dart';
import 'package:travelapp/app/data/models/user.dart';
import 'package:travelapp/app/data/repository/destination.dart';
import 'package:travelapp/app/data/repository/hotel.dart';

class HomeController extends GetxController {
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  Rx<User> _currentUser = User().obs;
  User get currentUser => _currentUser.value;
  set currentUser(value) => _currentUser.value = value;

  RxList<Hotel> _hotelList = List<Hotel>.empty(growable: true).obs;
  List<Hotel> get hotelList => _hotelList;
  set hotelList(value) => _hotelList.value = value;

  RxList<Destination> _destinationList =
      List<Destination>.empty(growable: true).obs;
  List<Destination> get destinationList => _destinationList;
  set destinationList(value) => _destinationList.value = value;

  Future loadData() async {
    loading = true;
    currentUser = await StorageHelper.getUserFromStorage();
    hotelList = await HotelRepository.getHotels();
    destinationList = await DestinationRepository.getDestinations();
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
