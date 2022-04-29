class ChatBot {
  String? message;
  bool? isMe;

  ChatBot({
    this.isMe = true,
    this.message = '',
  });

  factory ChatBot.fromJson(Map<String, dynamic> json) {
    return ChatBot(
      message: json['response'] ?? '',
      isMe: json['isMe'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'response': message,
        'isMe': isMe,
      };
}
