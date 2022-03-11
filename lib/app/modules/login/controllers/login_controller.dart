import 'package:get/get.dart';
import 'package:flutter/material.dart';
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

  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email không được trống';
    }
    if (!GetUtils.isEmail(email)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Mật khẩu không được trống';
    }
    if (password.length < 6) {
      return "Mật khẩu phải lớn hơn 6 ký tự";
    }
    return null;
  }

  void checkLogin() {
    final isValid = signupFormKey.currentState!.validate();
    if (!isValid) {
      // Get.snackbar(
      //   "Thất bại",
      //   "Đăng ký thất bại.",
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      return;
    }
    signupFormKey.currentState!.save();
    Get.offAllNamed(Routes.HOME);
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
