import 'package:crypto_link/data/models/chat_messages.dart';

class User {
  int id;
  String name;
  String profilePic;
  List<ChatMessage> chatMessages = [];

  User({
    required this.id,
    required this.name,
    this.profilePic =
        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
  });

  void addNewMessage(text, isSender) {
    ChatMessage newMessage = ChatMessage(text: text, isSender: isSender);
    chatMessages.add(newMessage);
  }
}
