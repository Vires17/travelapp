// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/option_controller.dart';

class OptionView extends GetView<OptionController> {
  const OptionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Option")),
      backgroundColor: Colors.lightBlue,
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(30.0),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        "assets/restaurant.png",
                        width: 60,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text("Nhà hàng", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(30.0),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        "assets/place.png",
                        width: 60,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text("Địa điểm", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(30.0),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        "assets/tour-bus.png",
                        width: 60,
                      ),
                      Text("Combo du lịch", style: TextStyle(fontSize: 15.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(30.0),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        "assets/hotel.png",
                        width: 60,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text("Khách sạn", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
