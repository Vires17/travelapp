import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/components/HeaderTitle.dart';
import 'package:travelapp/app/components/HotelCard.dart';
import 'package:travelapp/app/components/coming_soon.dart';
import 'package:travelapp/app/modules/hotel_details/controllers/hotel_details_controller.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class AnotherHotels extends StatelessWidget {
  AnotherHotels({
    Key? key,
  }) : super(key: key);

  HotelDetailsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = MediaQuery.of(context).size.width / 3.3;
    double cardHeight = MediaQuery.of(context).size.height / 3.6;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          HeaderTitle(
            title: "Another Hotels",
          ),
          Obx(() {
            if (controller.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (controller.relatedHotelList.length == 0) {
              return const ComingSoon();
            }
            return Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: GridView.count(
                childAspectRatio: 1 / 1.2,
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  controller.relatedHotelList.length,
                  (index) {
                    return HotelCard(
                      image: controller
                          .relatedHotelList[index].coverImage!.originalUrl!,
                      name: controller.relatedHotelList[index].name!,
                      price:
                          'From \$${controller.relatedHotelList[index].priceFrom}',
                      onPress: () {
                        Get.toNamed(
                          Routes.HOTEL_DETAILS,
                          arguments: controller.relatedHotelList[index],
                        );
                      },
                    );
                  },
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
