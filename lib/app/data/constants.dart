import 'package:flutter/material.dart';

final String API_URL = "http://10.0.2.2:1337";
final String APP_TOKEN =
    '353863ac1aba1b4422a968ff92fa77503a3460efca5e51f0e1eb661db2e5ae660d2d82e86cdc7fc72953159edbcb29e7c4e99f02b8769e6fe2b4d8cc38e4031f4f74120008126830f812be57110efdf67898d0d0da4c8337ca3ccb922bff7579016e81061c4d7a3d3fdf0d2d142ba420ad3014cb755fed68e26502bda4802563';

final Color primaryColor = Color.fromARGB(255, 103, 191, 167);
final Color secondaryColor = Color.fromARGB(255, 219, 96, 109);
final Color greyColor = Colors.grey;

InputDecoration buildDecorationTextFormField(
    {required String hintText, required IconData icon}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 10),
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.grey[400]),
    focusColor: primaryColor,
    prefixIcon: Icon(
      icon,
      color: primaryColor,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: primaryColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: primaryColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: secondaryColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: secondaryColor),
    ),
  );
}
