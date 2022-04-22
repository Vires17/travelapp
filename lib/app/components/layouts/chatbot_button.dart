import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/routes/app_pages.dart';

final chatbot = FloatingActionButton(
  onPressed: () {
    Get.toNamed(Routes.CHATBOT);
  },
  child: Icon(Icons.message_outlined),
  backgroundColor: Color(0xFF6C6969),
);
