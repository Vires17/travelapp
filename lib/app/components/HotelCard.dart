import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  HotelCard({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.onPress,
  }) : super(key: key);
  final String image, name, price;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(26),
              ),
            ),
            child: Image.asset(
              image,
              height: 160,
              width: 172,
            ),
          ),
          Text(name),
          Text(price),
        ],
      ),
    );
  }
}
