import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:get/get.dart';
import 'package:travelapp/app/components/layouts/appbar.dart';
import 'package:travelapp/app/components/layouts/chatbot_button.dart';
import 'package:travelapp/app/components/layouts/drawer.dart';
import 'package:travelapp/app/modules/destination/views/another_hotels.dart';
import 'package:travelapp/app/modules/restaurant_details/components/Cover.dart';
import 'package:travelapp/app/modules/restaurant_details/views/another_restaurants.dart';
import 'package:travelapp/app/modules/restaurant_details/views/title.dart';

import '../controllers/restaurant_details_controller.dart';

class RestaurantDetailsView extends GetView<RestaurantDetailsController> {
  final restaurantDetailScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: restaurantDetailScaffoldKey,
      backgroundColor: Colors.white,
      appBar: TravelAppBar(
        onPress: () {
          restaurantDetailScaffoldKey.currentState!.openDrawer();
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
                imageUrl: controller.restaurant.coverImage!.originalUrl!,
              ),
              RestaurantTitle(
                title: controller.restaurant.name!,
                star: controller.restaurant.startCount!,
                viewer: 1234,
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Markdown(
                  data: controller.restaurant.content!,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
              AnotherRestaurants(),
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
