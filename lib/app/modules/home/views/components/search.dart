import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/helpers/validations.dart';
import 'package:travelapp/app/modules/home/controllers/home_controller.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);

  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 20,
      ),
      child: Form(
        key: controller.searchFormKey,
        child: TextFormField(
          onFieldSubmitted: (value) {
            controller.search = value;
            controller.searching();
          },
          decoration: InputDecoration(
            hintText: "Search anything",
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xff606060),
            ),
            filled: true,
            fillColor: Color(0xffEDEDED),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
