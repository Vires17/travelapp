import 'package:flutter/material.dart';

class NewPosts extends StatelessWidget {
  NewPosts({
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
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: destinations.length,
            itemBuilder: (_, index) {
              return Container(
                width: size.width,
                height: 80,
                margin: EdgeInsets.symmetric(vertical: 5),
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
                        "assets/sondon.png",
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
                            'Son Doong Cave - Vietnam’s natural wonder is featured on Google',
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
                                  Text('1234'),
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
                                  Text('1234'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
