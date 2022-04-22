import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travelapp/app/components/custom_button.dart';
import 'package:travelapp/app/components/layouts/appbar.dart';
import 'package:travelapp/app/components/layouts/drawer.dart';
import 'package:travelapp/app/components/styles.dart';
import 'package:travelapp/app/data/helpers/validations.dart';
import 'package:travelapp/app/modules/home/controllers/home_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final profileDetailScaffoldKey = GlobalKey<ScaffoldState>();
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: profileDetailScaffoldKey,
      backgroundColor: Colors.white,
      appBar: TravelAppBar(
        onPress: () {
          profileDetailScaffoldKey.currentState!.openDrawer();
        },
      ),
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Container(
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Obx(() {
              if (controller.loading) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: Image.asset("assets/avatar.jpg").image,
                    radius: 50,
                  ),
                  SizedBox(height: 20),
                  Text(
                    controller.currentUser.username ?? '',
                    style: TextStyle(
                      color: Color(0xff070707),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: controller.updateFormKey,
                    child: Container(
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: controller.name,
                            decoration: buildDecorationTextFormField(
                              hintText: controller.currentUser.username!,
                              icon: Icons.person,
                            ),
                            keyboardType: TextInputType.name,
                            onSaved: (value) {
                              if (value != '') controller.name = value!;
                            },
                            validator: (value) {
                              return Validations.validateName(value!);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            initialValue: controller.currentUser.email!,
                            decoration: buildDecorationTextFormField(
                              hintText: controller.currentUser.email!,
                              icon: Icons.email,
                            ),
                            keyboardType: TextInputType.name,
                            onSaved: (value) {
                              if (value != '') controller.email = value!;
                            },
                            validator: (value) {
                              return Validations.validateEmail(value!);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            initialValue: controller.currentUser.phone,
                            decoration: buildDecorationTextFormField(
                              hintText: "0947 685 343",
                              icon: Icons.phone,
                            ),
                            keyboardType: TextInputType.name,
                            onSaved: (value) {
                              if (value != '') controller.phone = value!;
                            },
                            validator: (value) {
                              return Validations.validatePhone(value!);
                            },
                          ),
                          SizedBox(height: 20),
                          CustomButton(
                            width: 167,
                            height: 45,
                            text: "Update",
                            backgroundColor: Color(0xff2C2D2C),
                            onPressed: () {
                              controller
                                  .handleUpdate(controller.currentUser.id!);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            })),
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyDrawer(screenContext: context);
  }
}
