import 'package:flutter/material.dart';

final Color primaryColor = Color.fromARGB(255, 103, 191, 167);
final Color secondaryColor = Color.fromARGB(255, 219, 96, 109);
final Color greyColor = Colors.grey;

InputDecoration buildDecorationTextFormField({
  required String hintText,
  required IconData icon,
  bool iconShowPassword = false,
  bool showPassword = false,
  VoidCallback? handleToggleShowPass,
}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 10),
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.grey[400]),
    focusColor: primaryColor,
    prefixIcon: Icon(
      icon,
      color: Color(0xff606060),
    ),
    suffixIcon: iconShowPassword
        ? IconButton(
            icon: Icon(
              showPassword ? Icons.visibility_off : Icons.visibility,
              color: greyColor,
            ),
            onPressed: handleToggleShowPass ??
                () {
                  //
                },
          )
        : null,
    filled: true,
    fillColor: Color(0xffEDEDED),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
  );
}
