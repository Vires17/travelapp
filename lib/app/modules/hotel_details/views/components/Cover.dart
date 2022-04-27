import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/modules/hotel_details/controllers/hotel_details_controller.dart';

class Cover extends StatelessWidget {
  Cover({
    Key? key,
    required this.size,
    required this.imageUrl,
  }) : super(key: key);

  final Size size;

  final String imageUrl;

  HotelDetailsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: controller.hotel.images.length,
      options: CarouselOptions(
        height: size.height * 0.3,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Container(
          width: size.width,
          height: size.height * 0.3,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ClipRRect(
            child: Image.network(
              controller.hotel.images[itemIndex].originalUrl!,
              height: double.infinity,
              width: double.infinity,
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
        );
      },
    );
  }
}
