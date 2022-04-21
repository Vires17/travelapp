import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.size,
    required this.title,
    required this.star,
    required this.viewer,
    required this.image,
    required this.onPress,
  }) : super(key: key);

  final Size size;
  final String title, image;
  final int star, viewer;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: size.width,
        height: 80,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(26),
                ),
              ),
              child: Image.asset(
                image,
                height: 84,
                width: 84,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
