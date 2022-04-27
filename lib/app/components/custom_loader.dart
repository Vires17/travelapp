import 'package:flutter/material.dart';
import 'package:travelapp/app/components/loaders/color_loader_3.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          // color: primaryColor.withOpacity(0.1),
          ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please wait a moment...",
              style: TextStyle(
                color: Color.fromARGB(255, 103, 191, 167),
                fontWeight: FontWeight.w700,
              ),
            ),
            ColorLoader3(
              radius: 25,
              dotRadius: 7,
            ),
          ],
        ),
      ),
    );
  }
}
