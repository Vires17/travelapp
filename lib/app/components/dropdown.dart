import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/modules/home/controllers/home_controller.dart';

class DropdownCustom extends StatelessWidget {
  DropdownCustom({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButton<String>(
        value: controller.currentAddress,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 0,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? newValue) {
          controller.currentAddress = newValue;
        },
        items: controller.addressList
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });
  }
}
