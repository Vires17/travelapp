import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/helpers/storage_helper.dart';
import 'package:travelapp/app/data/models/chatbot.dart';
import 'package:travelapp/app/data/models/user.dart';
import 'package:travelapp/app/data/repository/chatbot.dart';

class ChatbotController extends GetxController {
  final GlobalKey<FormState> chatbotFormKey = new GlobalKey<FormState>();
  final messageController = TextEditingController();

  ScrollController scrollController = new ScrollController();

  var message = '';

  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;

  Rx<User> _currentUser = User().obs;
  User get currentUser => _currentUser.value;
  set currentUser(value) => _currentUser.value = value;

  RxList<ChatBot> _messageList = List<ChatBot>.empty(growable: true).obs;
  List<ChatBot> get messageList => _messageList;
  set messageList(value) => _messageList.value = value;

  Future<void> sendMessage() async {
    final isValid = chatbotFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    chatbotFormKey.currentState!.save();
    if (message == "") {
      return;
    }
    print("Send message " + message + " by user " + currentUser.id!.toString());
    messageList.add(ChatBot(message: message));

    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
    messageList.add(ChatBot(message: "...", isMe: false));
    messageController.clear();
    ChatBot serverMessage =
        await ChatBotRepository.getResponse(message, currentUser.id!);
    messageList.removeLast();
    messageList.add(serverMessage);
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
    StorageHelper.saveMessageChatBotToStorage(messageList);
  }
  //

  Future loadData() async {
    loading = true;
    currentUser = await StorageHelper.getUserFromStorage();
    messageList = await StorageHelper.getMessageChatBotFromStorage();
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
    loading = false;
  }

  @override
  void onInit() async {
    await loadData();
    super.onInit();
    ever(_messageList, (value) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });
  }

  @override
  void onReady() {
    super.onReady();
    _messageList.listen((value) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });
  }

  @override
  void onClose() {}
}
