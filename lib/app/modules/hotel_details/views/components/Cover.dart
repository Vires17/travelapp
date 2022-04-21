import 'package:flutter/material.dart';

class Cover extends StatelessWidget {
  const Cover({
    Key? key,
    required this.size,
    required this.imageUrl,
  }) : super(key: key);

  final Size size;

  final String imageUrl;

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
          child: Image.network(
            imageUrl,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
