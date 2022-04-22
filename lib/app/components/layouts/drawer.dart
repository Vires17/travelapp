import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';
import 'package:travelapp/app/data/models/user.dart';
import 'package:travelapp/app/modules/home/controllers/home_controller.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({
    Key? key,
    required this.screenContext,
  }) : super(key: key);

  BuildContext screenContext;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(screenContext).size;
    return Obx(() {
      HomeController homeController = Get.find();
      return Column(children: [
        Expanded(
          child: Drawer(
            child: Material(
              child: ListView(
                children: <Widget>[
                  Container(
                    width: size.width,
                    color: Color(0xff6C6969),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                Image.asset("assets/avatar.jpg").image,
                            radius: 30,
                          ),
                          SizedBox(height: 20),
                          Text(
                            homeController.currentUser.username ?? '',
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildMenuItem(
                    text: 'My Profile',
                    icon: Icons.person_outline_outlined,
                    iconColor: Color(0xff000000),
                    onPressed: () {
                      Get.toNamed(Routes.PROFILE);
                    },
                  ),
                  buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout,
                    iconColor: Color(0xff000000),
                    onPressed: () async {
                      await StorageHelper.clearAll();
                      Get.offAllNamed(Routes.LOGIN);
                    },
                  ),
                ],
              ),
            ),
          ),
        )
      ]);
    });
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    required iconColor,
    required GestureTapCallback onPressed,
  }) {
    final hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
      hoverColor: hoverColor,
      onTap: onPressed,
    );
  }
}
