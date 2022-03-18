// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/repository/user.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> signupFormKey = new GlobalKey<FormState>();
  final GlobalKey<FormFieldState> passKey = GlobalKey<FormFieldState>();

  var name = '';
  var email = '';
  var phone = '';
  var password = '';
  var confirmPassword = '';

  RxBool _showPass = false.obs;
  bool get showPass => _showPass.value;
  set showPass(value) => _showPass.value = value;

  RxBool _showRePass = false.obs;
  bool get showRePass => _showRePass.value;
  set showRePass(value) => _showRePass.value = value;

  void toggleShowPass() {
    showPass = !showPass;
  }

  void toggleShowRePass() {
    showRePass = !showRePass;
  }

  void checkSignUp() async {
    final isValid = signupFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signupFormKey.currentState!.save();
    bool isCreated =
        await UserRepository.createUser(name, email, phone, password);

    if (isCreated) {
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
    } else {
      Get.snackbar(
        "Thất bại",
        "Đăng ký thất bại.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    // Get.toNamed(Routes.LOGIN);
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
