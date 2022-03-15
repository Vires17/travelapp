import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLogin = await StorageHelper.checkExistsKey('user');
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: isLogin ? Routes.HOME : AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
