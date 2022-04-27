import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/components/HeaderTitle.dart';
import 'package:travelapp/app/components/PostCard.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class RelatedPost extends StatelessWidget {
  RelatedPost({
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          HeaderTitle(title: "Related posts"),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (_, index) {
                return PostCard(
                  size: size,
                  title:
                      "Son Doong Cave - Vietnam’s natural wonder is featured on Google",
                  star: 1234,
                  viewer: 1234,
                  image:
                      "https://travel-api-public.s3.ap-southeast-1.amazonaws.com/large_144525984_36ecbf2f08.jpg",
                  onPress: () {
                    Get.toNamed(Routes.POST_DETAILS);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
