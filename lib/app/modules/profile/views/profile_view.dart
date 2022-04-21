import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travelapp/app/components/custom_button.dart';
import 'package:travelapp/app/components/layouts/appbar.dart';
import 'package:travelapp/app/components/layouts/drawer.dart';
import 'package:travelapp/app/components/styles.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final profileDetailScaffoldKey = GlobalKey<ScaffoldState>();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: Image.asset("assets/avatar.jpg").image,
                radius: 50,
              ),
              SizedBox(height: 20),
              Text(
                'TRAN DANG KHOA',
                style: TextStyle(
                  color: Color(0xff070707),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: buildDecorationTextFormField(
                        hintText: "Tran Dang Khoa",
                        icon: Icons.person,
                      ),
                      keyboardType: TextInputType.name,
                      onSaved: (value) {
                        //
                      },
                      validator: (value) {
                        //
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: buildDecorationTextFormField(
                        hintText: "richardktran.dev@gmail.com",
                        icon: Icons.email,
                      ),
                      keyboardType: TextInputType.name,
                      onSaved: (value) {
                        //
                      },
                      validator: (value) {
                        //
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: buildDecorationTextFormField(
                        hintText: "0947 685 343",
                        icon: Icons.phone,
                      ),
                      keyboardType: TextInputType.name,
                      onSaved: (value) {
                        //
                      },
                      validator: (value) {
                        //
                      },
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      width: 167,
                      height: 45,
                      text: "Update",
                      backgroundColor: Color(0xff2C2D2C),
                      onPressed: () {
                        //
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyDrawer(screenContext: context);
  }
}
