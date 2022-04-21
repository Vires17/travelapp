import 'package:flutter/material.dart';
import 'package:travelapp/app/components/HeaderTitle.dart';

class NewIdeas extends StatelessWidget {
  NewIdeas({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final List<String> destinations = <String>[
    'Hạ Long Bay',
    'Hà Nội',
    'Đà Nẵng'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderTitle(
          title: "New ideas",
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          height: size.height * 0.3,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(26),
                        ),
                      ),
                      child: Image.asset(
                        "assets/halongbay.png",
                        height: size.height * 0.25,
                      ),
                    ),
                    Text('${destinations[index]}'),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
