import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/components/HeaderTitle.dart';
import 'package:travelapp/app/components/HotelCard.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class AnotherHotels extends StatelessWidget {
  AnotherHotels({
    Key? key,
  }) : super(key: key);

  final List<String> destinations = <String>[
    'Hạ Long Bay',
    'Hà Nội',
    'Đà Nẵng'
  ];

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
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: GridView.count(
              childAspectRatio: 1 / 1.2,
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                3,
                (index) {
                  return HotelCard(
                      image:
                          "https://travel-api-public.s3.ap-southeast-1.amazonaws.com/large_144525984_36ecbf2f08.jpg",
                      name: 'Vinpearl Hotel Can Tho',
                      price: 'From \$40',
                      onPress: () {
                        Get.toNamed(Routes.HOTEL_DETAILS);
                      });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
