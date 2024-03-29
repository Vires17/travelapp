import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travelapp/app/components/layouts/appbar.dart';
import 'package:travelapp/app/components/layouts/chatbot_button.dart';
import 'package:travelapp/app/components/layouts/drawer.dart';
import 'package:travelapp/app/modules/destination/views/another_hotels.dart';
import 'package:travelapp/app/modules/destination/views/components/Cover.dart';
import 'package:travelapp/app/modules/destination/views/related_post.dart';
import 'package:travelapp/app/modules/destination/views/title.dart';
import 'package:travelapp/app/modules/home/views/components/hotels.dart';

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
      floatingActionButton: chatbot,
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Cover(
                size: size,
                imageUrl: controller.destination.coverImage!.originalUrl!,
              ),
              DestinationTitle(
                title: controller.destination.name ?? '',
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  children: [
                    RelatedPost(),
                    AnotherHotels(),
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
