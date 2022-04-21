import 'package:flutter/material.dart';
import 'package:travelapp/app/components/HeaderTitle.dart';
import 'package:travelapp/app/components/HotelCard.dart';

class Hotels extends StatelessWidget {
  Hotels({
    Key? key,
  }) : super(key: key);

  final List<String> destinations = <String>[
    'Hạ Long Bay',
    'Hà Nội',
    'Đà Nẵng'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = MediaQuery.of(context).size.width / 3.3;
    double cardHeight = MediaQuery.of(context).size.height / 3.6;
    return Column(
      children: [
        HeaderTitle(
          title: "Hotels",
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: GridView.count(
            childAspectRatio: 1 / 1.2,
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              20,
              (index) {
                return HotelCard(
                  image: "assets/vinpearl_hotel_CT.png",
                  name: 'Vinpearl Hotel Can Tho',
                  price: 'From \$40',
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
