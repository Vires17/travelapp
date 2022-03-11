// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travelapp/app/components/DatePickerCustom.dart';
import 'package:travelapp/app/components/dropdown.dart';
import 'package:travelapp/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 130,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      child: Image.asset('assets/plane.jpg'),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                  // ignore: unnecessary_const
                  child: Center(
                    child: Text(
                      "TRAVEL APP",
                      // ignore: unnecessary_const
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 30),
                    ),
                  ),
                ),
                Container(
                  // color: Colors.cyan,
                  margin: EdgeInsets.only(left: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Địa điểm: "),
                          SizedBox(width: 30),
                          DropdownCustom(),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Ngày đi "),
                          SizedBox(width: 30),
                          DatePickerCustom()
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 20),
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.OPTION);
                      },
                      child: Text(
                        "TÌM",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
