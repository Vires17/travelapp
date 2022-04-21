import 'package:flutter/material.dart';

class Cover extends StatelessWidget {
  const Cover({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

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
          child: Image.asset(
            "assets/nhatrang-01-min_1.jpg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
