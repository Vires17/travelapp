import 'package:flutter/material.dart';

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
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20, left: 5),
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                child: Text(
                  "New ideas",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      //
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "Xem thêm",
                        style: TextStyle(
                          color: Color(0xff3bb9d9),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
