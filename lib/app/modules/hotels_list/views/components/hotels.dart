import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/components/HeaderTitle.dart';
import 'package:travelapp/app/components/HotelCard.dart';
import 'package:travelapp/app/modules/home/controllers/home_controller.dart';
import 'package:travelapp/app/modules/hotels_list/controllers/hotels_list_controller.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class Hotels extends StatelessWidget {
  Hotels({
    Key? key,
  }) : super(key: key);

  HotelsListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = MediaQuery.of(context).size.width / 3.3;
    double cardHeight = MediaQuery.of(context).size.height / 3.6;
    return Column(
      children: [
        HeaderTitle(
          title: "All Hotels",
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
                  controller.hotelList.length,
                  (index) {
                    return HotelCard(
                      image:
                          controller.hotelList[index].coverImage!.originalUrl!,
                      name: controller.hotelList[index].name!,
                      price: 'From \$${controller.hotelList[index].priceFrom}',
                      onPress: () {
                        Get.toNamed(
                          Routes.HOTEL_DETAILS,
                          arguments: controller.hotelList[index],
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
