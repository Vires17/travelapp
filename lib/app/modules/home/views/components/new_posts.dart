import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/components/HeaderTitle.dart';
import 'package:travelapp/app/components/PostCard.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class NewPosts extends StatelessWidget {
  NewPosts({
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
    return Column(
      children: [
        HeaderTitle(title: "New posts"),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: destinations.length,
            itemBuilder: (_, index) {
              return PostCard(
                size: size,
                title:
                    "Son Doong Cave - Vietnam’s natural wonder is featured on Google",
                star: 1234,
                viewer: 1234,
                image: "assets/sondon.png",
                onPress: () {
                  Get.toNamed(Routes.POST_DETAILS);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
