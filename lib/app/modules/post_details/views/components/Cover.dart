import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/modules/post_details/controllers/post_details_controller.dart';

class Cover extends StatelessWidget {
  Cover({
    Key? key,
    required this.size,
    required this.imageUrl,
  }) : super(key: key);

  final Size size;

  final String imageUrl;

  PostDetailsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.3,
      // height: 286,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
            bottomLeft: const Radius.circular(26.0),
            bottomRight: const Radius.circular(26.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: new BorderRadius.only(
            bottomLeft: const Radius.circular(26.0),
            bottomRight: const Radius.circular(26.0),
          ),
          child: Image.network(
            imageUrl,
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
      ),
    );
  }
}
