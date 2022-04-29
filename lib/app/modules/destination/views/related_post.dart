import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/components/HeaderTitle.dart';
import 'package:travelapp/app/components/PostCard.dart';
import 'package:travelapp/app/components/coming_soon.dart';
import 'package:travelapp/app/modules/destination/controllers/destination_controller.dart';
import 'package:travelapp/app/modules/post_details/controllers/post_details_controller.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class RelatedPost extends StatelessWidget {
  RelatedPost({
    Key? key,
  }) : super(key: key);

  DestinationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          HeaderTitle(title: "Related posts"),
          Obx(() {
            if (controller.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (controller.relatedPostList.length == 0) {
              return const ComingSoon();
            }
            return Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.relatedPostList.length,
                itemBuilder: (_, index) {
                  return PostCard(
                    size: size,
                    title: controller.relatedPostList[index].title!,
                    star: controller.relatedPostList[index].startCount!,
                    viewer: controller.relatedPostList[index].viewCount!,
                    image: controller
                        .relatedPostList[index].coverImage!.originalUrl!,
                    onPress: () {
                      Get.toNamed(
                        Routes.POST_DETAILS,
                        arguments: controller.relatedPostList[index],
                      );
                    },
                  );
                },
              ),
            );
          })
        ],
      ),
    );
  }
}
