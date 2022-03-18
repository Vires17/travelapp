import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/models/destination.dart';
import 'package:travelapp/app/modules/home/controllers/home_controller.dart';

class DropdownCustom extends StatelessWidget {
  DropdownCustom({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading == true || controller.addressList.isEmpty) {
        return CircularProgressIndicator();
      }
      return DropdownButton<Destination>(
        value: controller.currentAddress.id != -1
            ? controller.currentAddress
            : controller.addressList[0],
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 0,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (Destination? newValue) {
          controller.currentAddress = newValue;
        },
        items: controller.addressList
            .map<DropdownMenuItem<Destination>>((Destination value) {
          return DropdownMenuItem<Destination>(
            value: value,
            child: Text(value.name!),
          );
        }).toList(),
      );
    });
  }
}
