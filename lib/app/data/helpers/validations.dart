import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Validations {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email is not empty';
    }
    if (!GetUtils.isEmail(email)) {
      return 'Email is not valid';
    }
    return null;
  }

  static String? validateName(String name) {
    if (name.length >= 255) {
      return 'Your name is not exceed 255 characters';
    }
    // if (name.length < 3) {
    //   return "Your name is too short";
    // }
    if (name.isEmpty) {
      return 'Your name is not empty';
    }
    return null;
  }

  static String? validatePhone(String phone) {
    if (phone.isEmpty) {
      return 'Phone number is not empty';
    }
    if (!GetUtils.isPhoneNumber(phone)) {
      return 'Phone number is not a valid';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is not empty';
    }
    if (password.length < 6) {
      return "Password must be at least 6 characters";
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
