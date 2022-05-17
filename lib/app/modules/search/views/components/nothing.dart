import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/components/HeaderTitle.dart';
import 'package:travelapp/app/components/HotelCard.dart';
import 'package:travelapp/app/components/RestaurantCard.dart';
import 'package:travelapp/app/components/coming_soon.dart';
import 'package:travelapp/app/modules/home/controllers/home_controller.dart';
import 'package:travelapp/app/modules/search/controllers/search_controller.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class Nothing extends StatelessWidget {
  Nothing({
    Key? key,
  }) : super(key: key);

  SearchController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = MediaQuery.of(context).size.width / 3.3;
    double cardHeight = MediaQuery.of(context).size.height / 3.6;
    return Obx(() {
      if (controller.restaurantList.isEmpty &&
          controller.hotelList.isEmpty &&
          controller.postList.isEmpty) {
        return ComingSoon();
      }
      return SizedBox.shrink();
    });
  }
}
