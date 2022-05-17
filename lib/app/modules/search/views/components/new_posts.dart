import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/components/HeaderTitle.dart';
import 'package:travelapp/app/components/PostCard.dart';
import 'package:travelapp/app/modules/home/controllers/home_controller.dart';
import 'package:travelapp/app/modules/search/controllers/search_controller.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class NewPosts extends StatelessWidget {
  NewPosts({
    Key? key,
  }) : super(key: key);

  SearchController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() {
      if (controller.postList.isEmpty) {
        return SizedBox.shrink();
      }
      return Column(
        children: [
          HeaderTitle(title: "Posts", hideViewMore: true),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.postList.length,
              itemBuilder: (_, index) {
                return PostCard(
                  size: size,
                  title: controller.postList[index].title!,
                  star: controller.postList[index].startCount!,
                  viewer: controller.postList[index].viewCount!,
                  image: controller.postList[index].coverImage!.originalUrl!,
                  onPress: () {
                    Get.toNamed(
                      Routes.POST_DETAILS,
                      arguments: controller.postList[index],
                    );
                  },
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
