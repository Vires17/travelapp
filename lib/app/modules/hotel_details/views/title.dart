import 'package:flutter/material.dart';
import 'package:travelapp/app/components/Rating.dart';
import 'package:travelapp/app/components/TagContact.dart';

class HotelTitle extends StatelessWidget {
  HotelTitle({
    Key? key,
    required this.title,
    required this.star,
    required this.viewer,
  }) : super(key: key);

  final String title;
  final int viewer;
  final double star;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          StarRating(
            starCount: 5,
            rating: star,
            color: Color(0xffFFAA04),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              TagContact(
                backgroundColor: Color(0xff2C8C0B),
                text: 'Phone',
                icon: Icons.phone,
              ),
              SizedBox(width: 15),
              TagContact(
                backgroundColor: Color(0xff098BA8),
                text: 'Email',
                icon: Icons.email,
              ),
              SizedBox(width: 15),
              TagContact(
                backgroundColor: Color(0xff0E0C7E),
                text: 'Facebook',
                icon: Icons.facebook,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
