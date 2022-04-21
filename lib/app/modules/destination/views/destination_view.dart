import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travelapp/app/components/layouts/appbar.dart';
import 'package:travelapp/app/components/layouts/drawer.dart';
import 'package:travelapp/app/modules/destination/views/components/Cover.dart';
import 'package:travelapp/app/modules/destination/views/title.dart';
import 'package:travelapp/app/modules/home/views/components/hotels.dart';
import 'package:travelapp/app/modules/home/views/components/new_posts.dart';

import '../controllers/destination_controller.dart';

class DestinationView extends GetView<DestinationController> {
  final destinationDetailScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: destinationDetailScaffoldKey,
      backgroundColor: Colors.white,
      appBar: TravelAppBar(
        onPress: () {
          destinationDetailScaffoldKey.currentState!.openDrawer();
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
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Cover(size: size),
              DestinationTitle(
                title: 'HA LONG BAY',
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  children: [
                    NewPosts(),
                    Hotels(),
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