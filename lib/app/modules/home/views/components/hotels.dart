import 'package:flutter/material.dart';

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
        Container(
          width: double.infinity,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                child: Text(
                  "New posts",
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
          child: GridView.count(
            childAspectRatio: 1 / 1.2,
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              20,
              (index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(26),
                        ),
                      ),
                      child: Image.asset(
                        "assets/vinpearl_hotel_CT.png",
                        height: 160,
                        width: 172,
                      ),
                    ),
                    Text('Vinpearl Hotel Can Tho'),
                    Text('From \$40'),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
