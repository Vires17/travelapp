// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:travelapp/app/components/custom_button.dart';
import 'package:travelapp/app/components/custom_outline_button.dart';
import 'package:travelapp/app/components/styles.dart';
import 'package:travelapp/app/data/helpers/validations.dart';
import 'package:travelapp/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: controller.signupFormKey,
              child: Container(
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                          child: SvgPicture.asset('assets/Logo.svg'),
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
                            fontWeight: FontWeight.w700,
                            color: Color(0xff070707),
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: TextFormField(
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                        decoration: buildDecorationTextFormField(
                          hintText: "Email",
                          icon: Icons.email,
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
                      child: Obx(
                        () {
                          return TextFormField(
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
                            key: controller.passKey,
                            decoration: buildDecorationTextFormField(
                              hintText: "Password",
                              icon: Icons.lock,
                              iconShowPassword: true,
                              showPassword: controller.showPass,
                              handleToggleShowPass: () {
                                controller.toggleShowPass();
                              },
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.showPass ? false : true,
                            onSaved: (value) {
                              controller.password = value!;
                            },
                            validator: (value) {
                              return Validations.validatePassword(value!);
                            },
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomOutlineButton(
                          width: 147,
                          height: 35,
                          backgroundColor: Colors.white,
                          textColor: Color(0xff2C2D2C),
                          text: "Register",
                          onPressed: () {
                            Get.toNamed(Routes.REGISTER);
                          },
                        ),
                        CustomButton(
                          width: 147,
                          height: 35,
                          backgroundColor: Color(0xff2C2D2C),
                          text: "Login",
                          onPressed: () {
                            controller.checkLogin();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
