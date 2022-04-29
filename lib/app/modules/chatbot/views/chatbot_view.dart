import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travelapp/app/components/layouts/appbar.dart';
import 'package:travelapp/app/components/layouts/drawer.dart';
import 'package:travelapp/app/modules/chatbot/views/chat_content.dart';

import '../controllers/chatbot_controller.dart';

class ChatbotView extends GetView<ChatbotController> {
  final chatbotScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: chatbotScaffoldKey,
      backgroundColor: Colors.white,
      appBar: TravelAppBar(
        onPress: () {
          chatbotScaffoldKey.currentState!.openDrawer();
        },
      ),
      drawer: buildDrawer(context),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 70),
            child: ChatContent(),
          ),
          Form(
            key: controller.chatbotFormKey,
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.messageController,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      onSaved: (value) {
                        controller.message = value!;
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        hintText: "Message ...",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xff2C2D2C)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                      onTap: () async {
                        await controller.sendMessage();
                      },
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                            color: Color(0xff2C2D2C),
                            borderRadius: BorderRadius.circular(40)),
                        child: Image.asset(
                          'assets/send.png',
                          scale: 1.8,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyDrawer(screenContext: context);
  }
}
