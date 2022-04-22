import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';
import 'package:travelapp/app/data/models/user.dart';
import 'package:travelapp/app/data/repository/user.dart';
import 'package:travelapp/app/modules/home/controllers/home_controller.dart';

class ProfileController extends GetxController {
  final GlobalKey<FormState> updateFormKey = new GlobalKey<FormState>();
  var name = 'KHOA';
  var email = '';
  var phone = '';

  HomeController homeController = Get.find();

  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  Rx<User> _currentUser = User().obs;
  User get currentUser => _currentUser.value;
  set currentUser(value) => _currentUser.value = value;

  void handleUpdate(int userID) async {
    final isValid = updateFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    updateFormKey.currentState!.save();
    String isUpdated =
        await UserRepository.updateUser(userID, name, email, phone);

    if (isUpdated == "success") {
      Get.snackbar(
        'Successfully',
        'Successfully updated',
        snackPosition: SnackPosition.BOTTOM,
      );
      homeController.loadData();
      loadData();
    } else {
      Get.snackbar(
        "Register failed",
        isUpdated,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    // Get.toNamed(Routes.LOGIN);
  }

  Future loadData() async {
    loading = true;
    currentUser = await StorageHelper.getUserFromStorage();
    name = currentUser.username!;
    phone = currentUser.phone!;
    email = currentUser.email!;
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
