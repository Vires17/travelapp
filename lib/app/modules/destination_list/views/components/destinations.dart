import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/components/HeaderTitle.dart';
import 'package:travelapp/app/modules/destination_list/controllers/destination_list_controller.dart';
import 'package:travelapp/app/modules/home/controllers/home_controller.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class Destinations extends StatelessWidget {
  Destinations({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  DestinationListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderTitle(
          title: "Destinations",
          hideViewMore: true,
        ),
        Obx(() {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.destinationList.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.DESTINATION,
                        arguments: controller.destinationList[index]);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(26.0),
                          child: Image.network(
                            controller.destinationList[index].coverImage!
                                .originalUrl!,
                            width: size.width * 0.8,
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        ),
                        Text('${controller.destinationList[index].name}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        })
      ],
    );
  }
}
