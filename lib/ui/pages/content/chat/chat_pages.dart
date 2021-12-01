import 'package:crypto_link/data/models/chat.dart';
import 'package:crypto_link/ui/pages/content/chat/widgets/chat_cards.dart';
import 'package:crypto_link/ui/pages/content/messages/messages_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatsData.length,
      itemBuilder: (context, index) {
        return ChatCard(
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Messages(
                            isActivate: chatsData[index].isActive,
                            name: chatsData[index].name,
                            picUrl: chatsData[index].image,
                          )));
            },
            title: chatsData[index].name,
            picUrl: chatsData[index].image,
            content: chatsData[index].lastMessage,
            isActive: chatsData[index].isActive);
      },
    );
  }
}
