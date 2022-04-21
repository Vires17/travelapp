// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:travelapp/app/components/custom_button.dart';
import 'package:travelapp/app/components/styles.dart';
import 'package:travelapp/app/data/helpers/validations.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
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
      ),
    );
  }

  Padding buildNameField() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: TextFormField(
        style: const TextStyle(fontSize: 18, color: Colors.black),
        decoration: buildDecorationTextFormField(
          hintText: "Name",
          icon: Icons.person,
        ),
        keyboardType: TextInputType.name,
        onSaved: (value) {
          controller.name = value!;
        },
        validator: (value) {
          return Validations.validateName(value!);
        },
      ),
    );
  }

  Padding buildPhoneField() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: TextFormField(
        style: const TextStyle(fontSize: 18, color: Colors.black),
        decoration: buildDecorationTextFormField(
          hintText: "Phone number",
          icon: Icons.phone,
        ),
        keyboardType: TextInputType.phone,
        onSaved: (value) {
          controller.phone = value!;
        },
        validator: (value) {
          return Validations.validatePhone(value!);
        },
      ),
    );
  }

  Padding buildEmailField() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: TextFormField(
        style: const TextStyle(fontSize: 18, color: Colors.black),
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
    );
  }

  Padding buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Obx(
        () {
          return TextFormField(
            style: const TextStyle(fontSize: 18, color: Colors.black),
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
    );
  }

  Padding buildConfirmPasswordField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
      child: Obx(
        () {
          return TextFormField(
            style: const TextStyle(fontSize: 18, color: Colors.black),
            decoration: buildDecorationTextFormField(
              hintText: "Confirm Password",
              icon: Icons.lock,
              iconShowPassword: true,
              showPassword: controller.showRePass,
              handleToggleShowPass: () {
                controller.toggleShowRePass();
              },
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: controller.showRePass ? false : true,
            onSaved: (value) {
              controller.confirmPassword = value!;
            },
            validator: (value) {
              return Validations.validateConfirmPassword(
                  controller.passKey, value!);
            },
          );
        },
      ),
    );
  }

  Padding buildSignUpSubmit() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Center(
        child: CustomButton(
          width: 167,
          height: 35,
          backgroundColor: Color(0xff2C2D2C),
          text: "Signup",
          onPressed: () {
            controller.checkSignUp();
          },
        ),
      ),
    );
  }
}
