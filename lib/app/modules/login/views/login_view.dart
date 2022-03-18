// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travelapp/app/data/helpers/validations.dart';
import 'package:travelapp/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: controller.signupFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Center(
                      child: Container(
                        width: 150,
                        height: 130,
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: Image.asset('assets/plane.jpg'),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    // ignore: unnecessary_const
                    child: Center(
                      child: Text(
                        "TRAVEL APP",
                        // ignore: unnecessary_const
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 30),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle:
                            TextStyle(color: Colors.brown, fontSize: 15),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        controller.email = value!;
                      },
                      validator: (value) {
                        return Validations.validateEmail(value!);
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Obx(() {
                        return Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <Widget>[
                            TextFormField(
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                              key: controller.passKey,
                              decoration: InputDecoration(
                                labelText: "Mật khẩu",
                                labelStyle: TextStyle(
                                    color: Colors.brown, fontSize: 15),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: controller.showPass ? false : true,
                              onSaved: (value) {
                                controller.password = value!;
                              },
                              validator: (value) {
                                return Validations.validatePassword(value!);
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.toggleShowPass();
                              },
                              child: Text(
                                controller.showPass ? "ẨN" : "HIỆN",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        );
                      })),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                        onPressed: () {
                          controller.checkLogin();
                        },
                        child: Text(
                          "ĐĂNG NHẬP",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 130,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.REGISTER);
                          },
                          child: Text(
                            "Nhấn tại đây để đăng ký",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                        Text(
                          "Quên mật khẩu",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blueAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
