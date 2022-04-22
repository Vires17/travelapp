import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travelapp/app/components/layouts/appbar.dart';
import 'package:travelapp/app/components/layouts/drawer.dart';

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
            child: ChatMessageList(),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.messageEditingController,
                    style: TextStyle(color: Colors.black, fontSize: 16),
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
                    onTap: () {
                      //
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
        ],
      ),
    );
  }

  Widget ChatMessageList() {
    return ListView.builder(
      reverse: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        final randomNumberGenerator = Random();
        final randomBoolean = randomNumberGenerator.nextBool();
        // int? currentIndex = controller.messages.length - index - 1;
        // var timedata = (controller.messages[currentIndex]["time"]);
        // final time = DateTime.fromMillisecondsSinceEpoch(timedata);
        // final formatTime = DateTimeHelpers.dateTimeToTime(time);
        return Row(
          mainAxisAlignment:
              randomBoolean ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            // Text(
            //   '12:00',
            //   style: TextStyle(
            //     color: Colors.grey[500],
            //     fontSize: 12,
            //   ),
            // ),
            Container(
              padding: EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 16),
              alignment: randomBoolean ? Alignment.topRight : Alignment.topLeft,
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
                  color: Color(0xff2C2D2C),
                ),
                child: Text(
                  "This is message",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            // Text(
            //   '12:00',
            //   style: TextStyle(
            //     color: Colors.grey[500],
            //     fontSize: 12,
            //   ),
            // ),
          ],
        );
      },
    );
  }

  Widget buildDrawer(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyDrawer(screenContext: context);
  }
}
