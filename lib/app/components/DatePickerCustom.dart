// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/modules/home/controllers/home_controller.dart';

class DatePickerCustom extends StatelessWidget {
  DatePickerCustom({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != controller.selectedDate) {
      controller.selectedDate = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        children: <Widget>[
          Text(
            "${controller.selectedDate.toLocal()}".split(' ')[0],
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextButton(
            onPressed: () => _selectDate(context),
            child: Icon(
              Icons.calendar_today,
              color: Colors.blueGrey,
            ),
          ),
        ],
      );
    });
  }
}
