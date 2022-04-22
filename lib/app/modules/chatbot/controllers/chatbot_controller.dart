import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatbotController extends GetxController {
  TextEditingController messageEditingController = new TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
