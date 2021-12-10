import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_link/data/models/chat_messages.dart';
import 'package:crypto_link/domain/controller/chat_controller.dart';
import 'package:crypto_link/domain/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_input_field.dart';
import 'one_message.dart';

class BodyMessages extends StatefulWidget {
  final String picUrl, chatRoomId;
  const BodyMessages({Key? key, required this.picUrl, required this.chatRoomId})
      : super(key: key);

  @override
  State<BodyMessages> createState() => _BodyMessagesState();
}

class _BodyMessagesState extends State<BodyMessages> {
  ChatController controllerChat = Get.find();
  UserController controllerUser = Get.find();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("ChatRoom")
            .doc(widget.chatRoomId)
            .collection("chats")
            .orderBy("date", descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.data!.docs.isEmpty) {
            return Column(
              children: [
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                )),
                ChatInputField(chatRoomId: widget.chatRoomId),
              ],
            );
          }
          return Column(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data = snapshot.data!.docs[index]
                          .data() as Map<String, dynamic>;
                      bool isSender = false;
                      if (data['sendBy'] == controllerUser.data[0].name) {
                        isSender = true;
                      } else {
                        isSender = false;
                      }
                      return OneMessage(
                        message: data['message'],
                        picUrl: widget.picUrl,
                        isSender: isSender,
                      );
                    }),
              )),
              ChatInputField(chatRoomId: widget.chatRoomId),
            ],
          );
        });
  }
}
