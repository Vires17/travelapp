import 'package:get/get.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';
import 'package:travelapp/app/data/models/destination.dart';
import 'package:travelapp/app/data/models/user.dart';
import 'package:travelapp/app/data/repository/destination.dart';

class DestinationListController extends GetxController {
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  Rx<User> _currentUser = User().obs;
  User get currentUser => _currentUser.value;
  set currentUser(value) => _currentUser.value = value;

  RxList<Destination> _destinationList =
      List<Destination>.empty(growable: true).obs;
  List<Destination> get destinationList => _destinationList;
  set destinationList(value) => _destinationList.value = value;

  Future loadData() async {
    loading = true;
    currentUser = await StorageHelper.getUserFromStorage();
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
