import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/app/data/repository/user.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> signupFormKey = new GlobalKey<FormState>();
  final GlobalKey<FormFieldState> passKey = GlobalKey<FormFieldState>();

  var email = '';
  var password = '';

  RxBool _showPass = false.obs;
  bool get showPass => _showPass.value;
  set showPass(value) => _showPass.value = value;

  void toggleShowPass() {
    showPass = !showPass;
  }

  void checkLogin() async {
    final isValid = signupFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signupFormKey.currentState!.save();
    bool isLogin = await UserRepository.loginUser(email, password);
    if (isLogin) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar(
        "Thất bại",
        "Đăng nhập thất bại.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future loadData() async {
    //
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
