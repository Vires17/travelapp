import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/components/HeaderTitle.dart';
import 'package:travelapp/app/components/HotelCard.dart';
import 'package:travelapp/app/components/RestaurantCard.dart';
import 'package:travelapp/app/modules/home/controllers/home_controller.dart';
import 'package:travelapp/app/modules/restaurants_list/controllers/restaurants_list_controller.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class Restaurants extends StatelessWidget {
  Restaurants({
    Key? key,
  }) : super(key: key);

  RestaurantsListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = MediaQuery.of(context).size.width / 3.3;
    double cardHeight = MediaQuery.of(context).size.height / 3.6;
    return Column(
      children: [
        HeaderTitle(
          title: "Restaurants",
          hideViewMore: true,
        ),
        Obx(
          () {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: GridView.count(
                childAspectRatio: 1 / 1.2,
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  controller.restaurantList.length,
                  (index) {
                    return RestaurantCard(
                      image: controller
                          .restaurantList[index].coverImage!.originalUrl!,
                      name: controller.restaurantList[index].name!,
                      price:
                          'From \$${controller.restaurantList[index].priceFrom}',
                      onPress: () {
                        Get.toNamed(
                          Routes.RESTAURANT_DETAILS,
                          arguments: controller.restaurantList[index],
                        );
                      },
                    );
                  },
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
