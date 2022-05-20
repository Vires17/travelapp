class ChatBot {
  String? message;
  bool? isMe;

  ChatBot({
    this.isMe = true,
    this.message = '',
  });

  factory ChatBot.fromJson(Map<String, dynamic> json) {
    return ChatBot(
      message: json['text'] ?? '',
      isMe: json['isMe'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'text': message,
        'isMe': isMe,
      };
}
