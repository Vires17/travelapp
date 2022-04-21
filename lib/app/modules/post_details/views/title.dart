import 'package:flutter/material.dart';

class PostTitle extends StatelessWidget {
  PostTitle({
    Key? key,
    required this.title,
    required this.star,
    required this.viewer,
  }) : super(key: key);

  final String title;
  final int star, viewer;

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
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Color(0xff3bb9d9),
                    size: 14,
                  ),
                  Text(star.toString()),
                ],
              ),
              SizedBox(width: 15),
              Row(
                children: [
                  Icon(
                    Icons.remove_red_eye_outlined,
                    color: Color(0xff3bb9d9),
                    size: 14,
                  ),
                  Text(viewer.toString()),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
