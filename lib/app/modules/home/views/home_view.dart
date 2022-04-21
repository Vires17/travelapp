// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travelapp/app/components/DatePickerCustom.dart';
import 'package:travelapp/app/components/dropdown.dart';
import 'package:travelapp/app/components/layouts/appbar.dart';
import 'package:travelapp/app/components/layouts/drawer.dart';
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
      appBar: TravelAppBar(
        onPress: () {
          _scaffoldKey.currentState!.openDrawer();
        },
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
    return MyDrawer(screenContext: context);
  }
}
