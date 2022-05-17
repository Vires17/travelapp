import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/helpers/validations.dart';
import 'package:travelapp/app/modules/home/controllers/home_controller.dart';
import 'package:travelapp/app/modules/search/controllers/search_controller.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);

  SearchController controller = Get.find();

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
          initialValue: controller.search,
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
