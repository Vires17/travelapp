import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/modules/chatbot/controllers/chatbot_controller.dart';

class ChatContent extends StatelessWidget {
  ChatContent({
    Key? key,
  }) : super(key: key);

  ChatbotController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() {
      return ListView.builder(
        controller: controller.scrollController,
        // reverse: true,shrinkWrap: true
        shrinkWrap: true,
        itemCount: controller.messageList.length,
        itemBuilder: (context, index) {
          bool isMe = controller.messageList[index].isMe!;
          return Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.7,
                padding: EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 16),
                alignment: isMe ? Alignment.topRight : Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 8),
                  padding:
                      EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    color: isMe ? Color(0xff2C2D2C) : Color(0xffD84D4D),
                  ),
                  child: Text(
                    controller.messageList[index].message!,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
