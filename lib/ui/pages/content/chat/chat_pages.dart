import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_link/data/models/chat.dart';
import 'package:crypto_link/domain/controller/chat_controller.dart';
import 'package:crypto_link/domain/controller/user_controller.dart';
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
  ChatController controllerChat = Get.find();
  UserController controllerUser = Get.find();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('user/')
            .orderBy('isActive', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return ChatCard(
                title: data['name'],
                press: () async {
                  await controllerChat.createChatRoomAndStartConversation(
                      controllerUser.user[0].name, data['name']);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Messages(
                                chatRoomId: controllerChat.getChatRoomId(
                                    controllerUser.user[0].name, data['name']),
                                isActivate: data['isActive'],
                                name: data['name'],
                                picUrl: data['profilePic'],
                              )));
                },
                picUrl: data['profilePic'],
                isActive: data['isActive'],
                content: '',
              );
            }).toList(),
          );
        });
  }
}
