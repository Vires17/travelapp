import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Validations {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email không được trống';
    }
    if (!GetUtils.isEmail(email)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  static String? validateName(String name) {
    if (name.length >= 255) {
      return 'Tên bạn không được quá 255 ký tự';
    }
    if (name.isEmpty) {
      return 'Họ tên không được trống';
    }
    return null;
  }

  static String? validatePhone(String phone) {
    if (phone.isEmpty) {
      return 'Số điện thoại không được trống';
    }
    if (!GetUtils.isPhoneNumber(phone)) {
      return 'Số điện thoại không hợp lệ';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Mật khẩu không được trống';
    }
    if (password.length < 6) {
      return "Mật khẩu phải lớn hơn 6 ký tự";
    }
    return null;
  }

  static String? validateConfirmPassword(
      GlobalKey<FormFieldState> passKey, String confirmPassword) {
    var password = passKey.currentState!.value;
    if (confirmPassword != password) {
      return "Mật khẩu nhập lại không trùng khớp";
    }
    return null;
  }
}
