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
    final queryParams = {
      'message': message,
      'user_id': userId.toString(),
    };
    var url = Uri.https(SERVER_CHATBOT_URL, '/api/chat/', queryParams);

    var token = APP_TOKEN;
    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
    };
    var response = await http.get(url, headers: header);
    ChatBot chatbotResponse = ChatBot(
        message:
            'The system is overloaded, please wait a moment and send the request again.',
        isMe: false);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      dynamic data = result['data'];
      chatbotResponse = ChatBot.fromJson(data);
      return chatbotResponse;
    } else {
      return chatbotResponse;
    }
  }
}
