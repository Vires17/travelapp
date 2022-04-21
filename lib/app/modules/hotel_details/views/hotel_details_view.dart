import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travelapp/app/components/layouts/appbar.dart';
import 'package:travelapp/app/components/layouts/drawer.dart';
import 'package:travelapp/app/modules/hotel_details/views/another_hotels.dart';
import 'package:travelapp/app/modules/hotel_details/views/components/Cover.dart';
import 'package:travelapp/app/modules/hotel_details/views/hotel_content.dart';
import 'package:travelapp/app/modules/hotel_details/views/title.dart';

import '../controllers/hotel_details_controller.dart';

class HotelDetailsView extends GetView<HotelDetailsController> {
  final hotelDetailScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: hotelDetailScaffoldKey,
      backgroundColor: Colors.white,
      appBar: TravelAppBar(
        onPress: () {
          hotelDetailScaffoldKey.currentState!.openDrawer();
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
              HotelTitle(
                title: 'Vinpearl Hotel Can Tho',
                star: 1234,
                viewer: 1234,
              ),
              HotelContent(),
              AnotherHotels(),
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
