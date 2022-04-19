// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travelapp/app/components/DatePickerCustom.dart';
import 'package:travelapp/app/components/dropdown.dart';
import 'package:travelapp/app/data/constants.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';
import 'package:travelapp/app/modules/home/views/components/hotels.dart';
import 'package:travelapp/app/modules/home/views/components/new_idea.dart';
import 'package:travelapp/app/modules/home/views/components/new_posts.dart';
import 'package:travelapp/app/modules/home/views/components/search.dart';
import 'package:travelapp/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({
    Key? key,
  }) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Travel App"),
        leading: InkWell(
          child: Icon(Icons.menu),
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        backgroundColor: Color(0xFF6C6969),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
        },
        child: Icon(Icons.message_outlined),
        backgroundColor: Color(0xFF6C6969),
      ),
      drawer: buildDrawer(context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
            width: size.width,
            child: Column(
              children: [
                Search(),
                NewIdeas(
                  size: size,
                ),
                NewPosts(),
                Hotels(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
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
                          "TRAN DANG KHOA",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 16,
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
                  onPressed: () async {
                    await StorageHelper.clearAll();
                    Get.offAllNamed(Routes.LOGIN);
                  },
                ),
                buildMenuItem(
                  text: 'Logout',
                  icon: Icons.logout,
                  iconColor: Color(0xff000000),
                  onPressed: () {
                    //
                  },
                ),
              ],
            ),
          ),
        ),
      )
    ]);
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
