import 'package:flutter/material.dart';
import 'package:travelapp/app/components/Rating.dart';
import 'package:travelapp/app/components/TagContact.dart';

class DestinationTitle extends StatelessWidget {
  DestinationTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              color: Color(0xff4F4F4F),
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
