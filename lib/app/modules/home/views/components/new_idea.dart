import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/components/HeaderTitle.dart';
import 'package:travelapp/app/modules/home/controllers/home_controller.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class NewIdeas extends StatelessWidget {
  NewIdeas({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final List<String> destinations = <String>[
    'Hạ Long Bay',
    'Hà Nội',
    'Đà Nẵng'
  ];

  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderTitle(
          title: "New ideas",
        ),
        Obx(() {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            height: size.height * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.horizontal,
              itemCount: controller.destinationList.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.DESTINATION,
                        arguments: controller.destinationList[index]);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(26.0),
                          child: Image.network(
                            controller.destinationList[index].coverImage!
                                .originalUrl!,
                            height: size.height * 0.25,
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
