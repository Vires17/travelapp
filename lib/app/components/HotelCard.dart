import 'package:flutter/material.dart';
import 'package:travelapp/app/data/constants.dart';

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
          ClipRRect(
            borderRadius: BorderRadius.circular(26.0),
            child: Image.network(
              image,
              height: 160,
              width: 172,
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
          SizedBox(height: 10),
          Text(name),
          Text(price),
        ],
      ),
    );
  }
}
