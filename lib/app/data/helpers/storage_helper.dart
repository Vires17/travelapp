import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp/app/data/models/chatbot.dart';
import 'package:travelapp/app/data/models/user.dart';

class StorageHelper {
  static Future<bool> saveUserToStorage(Map<String, dynamic> user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userStore = jsonEncode(user);
    return await prefs.setString('user', userStore);
  }

  static Future<User> getUserFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(prefs.getString('user') ?? "");
    return User.fromJson(userMap);
  }

  static Future<void> clearAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  static Future<bool> checkExistsKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString('user');
    return user != null;
  }

  static Future<bool> saveMessageChatBotToStorage(
      List<ChatBot> messages) async {
    String json =
        jsonEncode(messages.map((i) => i.toJson()).toList()).toString();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String messageStore = jsonEncode(json);
    return await prefs.setString('message', messageStore);
  }

  static Future<List<ChatBot>> getMessageChatBotFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<ChatBot> messages = List<ChatBot>.empty(growable: true);
    if (prefs.getString('message') == null) {
      return messages;
    }
    String messageMap = jsonDecode(prefs.getString('message') ?? "");
    dynamic messageList = jsonDecode(messageMap);

    for (int i = 0; i < messageList.length; i++) {
      messages.add(ChatBot.fromJson(messageList[i]));
      print(messageList[i]);
    }

    return messages;
  }
}
