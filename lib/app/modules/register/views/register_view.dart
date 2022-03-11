// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
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
                  buildNameField(),
                  buildPhoneField(),
                  buildEmailField(),
                  buildPasswordField(),
                  buildConfirmPasswordField(),
                  buildSignUpSubmit(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildNameField() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: TextFormField(
        style: const TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
          labelText: "Họ Tên",
          labelStyle: TextStyle(color: Colors.brown, fontSize: 15),
        ),
        keyboardType: TextInputType.name,
        onSaved: (value) {
          controller.name = value!;
        },
        validator: (value) {
          return controller.validateName(value!);
        },
      ),
    );
  }

  Padding buildPhoneField() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: TextFormField(
        style: const TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
          labelText: "Số điện thoại",
          labelStyle: TextStyle(color: Colors.brown, fontSize: 15),
        ),
        keyboardType: TextInputType.phone,
        onSaved: (value) {
          controller.phone = value!;
        },
        validator: (value) {
          return controller.validatePhone(value!);
        },
      ),
    );
  }

  Padding buildEmailField() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: TextFormField(
        style: const TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
          labelText: "Email",
          labelStyle: TextStyle(color: Colors.brown, fontSize: 15),
        ),
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) {
          controller.email = value!;
        },
        validator: (value) {
          return controller.validateEmail(value!);
        },
      ),
    );
  }

  Padding buildPasswordField() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
        child: Obx(() {
          return Stack(
            alignment: AlignmentDirectional.centerEnd,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              TextFormField(
                style: const TextStyle(fontSize: 18, color: Colors.black),
                key: controller.passKey,
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  labelStyle: TextStyle(color: Colors.brown, fontSize: 15),
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: controller.showPass ? false : true,
                onSaved: (value) {
                  controller.password = value!;
                },
                validator: (value) {
                  return controller.validatePassword(value!);
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
        }));
  }

  Padding buildConfirmPasswordField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          TextFormField(
            style: const TextStyle(fontSize: 18, color: Colors.black),
            decoration: InputDecoration(
              labelText: "Xác nhận mật khẩu",
              labelStyle: TextStyle(color: Colors.brown, fontSize: 15),
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            onSaved: (value) {
              controller.confirmPassword = value!;
            },
            validator: (value) {
              return controller.validateConfirmPassword(value!);
            },
          ),
        ],
      ),
    );
  }

  Padding buildSignUpSubmit() {
    return Padding(
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
            controller.checkSignUp();
          },
          child: Text(
            "ĐĂNG KÝ",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
