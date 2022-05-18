import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/components/HeaderTitle.dart';
import 'package:travelapp/app/components/PostCard.dart';
import 'package:travelapp/app/modules/home/controllers/home_controller.dart';
import 'package:travelapp/app/modules/posts_list/controllers/posts_list_controller.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class PostList extends StatelessWidget {
  PostList({
    Key? key,
  }) : super(key: key);

  PostsListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        HeaderTitle(title: "New posts"),
        Obx(() {
          return Container(
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
          );
        })
      ],
    );
  }
}
