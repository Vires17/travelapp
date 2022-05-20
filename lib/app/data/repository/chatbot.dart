import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travelapp/app/data/constants.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';
import 'package:travelapp/app/data/models/chatbot.dart';
import 'package:travelapp/app/data/models/destination.dart';
import 'package:travelapp/app/data/models/user.dart';
import 'package:travelapp/app/routes/app_pages.dart';

class ChatBotRepository {
  static Future<ChatBot> getResponse(String message, int userId) async {
    var url = Uri.https(SERVER_CHATBOT_URL, '/webhooks/rest/webhook');

    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var body = {
      'sender': userId.toString(),
      'message': message,
    };
    var response = await http.post(url, body: json.encode(body), headers: header);
    ChatBot chatbotResponse = ChatBot(
        message:
            'The system is overloaded, please wait a moment and send the request again.',
        isMe: false);
        print(response);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      dynamic data = result[0];
      chatbotResponse = ChatBot.fromJson(data);
      return chatbotResponse;
    } else {
      return chatbotResponse;
    }
  }
}
