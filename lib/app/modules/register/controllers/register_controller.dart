import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email không được trống';
    }
    if (!GetUtils.isEmail(email)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  String? validateName(String name) {
    if (name.length >= 255) {
      return 'Tên bạn không được quá 255 ký tự';
    }
    if (name.isEmpty) {
      return 'Họ tên không được trống';
    }
    return null;
  }

  String? validatePhone(String phone) {
    if (phone.isEmpty) {
      return 'Số điện thoại không được trống';
    }
    if (!GetUtils.isPhoneNumber(phone)) {
      return 'Số điện thoại không hợp lệ';
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

  String? validateConfirmPassword(String confirmPassword) {
    var password = passKey.currentState!.value;
    if (confirmPassword != password) {
      return "Mật khẩu nhập lại không trùng khớp";
    }
    return null;
  }

  void checkSignUp() {
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
    Get.toNamed(Routes.LOGIN);
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
