import 'package:crypto_link/domain/controller/chat_controller.dart';
import 'package:crypto_link/domain/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatInputField extends StatefulWidget {
  final String chatRoomId;
  const ChatInputField({
    Key? key,
    required this.chatRoomId,
  }) : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final _messageController = TextEditingController();
  ChatController controllerChat = Get.find();
  UserController controllerUser = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15 / 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 32,
            color: const Color(0xFF087949).withOpacity(0.1),
          )
        ],
      ),
      child: SafeArea(
          child: Row(
        children: [
          Expanded(
              child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(children: [
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                    hintText: 'Type Message', border: InputBorder.none),
              )),
              IconButton(
                  onPressed: () async {
                    await controllerChat.sendMessage(
                        widget.chatRoomId,
                        _messageController.text,
                        controllerUser.user[0].name,
                        DateTime.now().toString());
                    _messageController.clear();
                  },
                  icon: const Icon(Icons.send),
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.6)),
            ]),
          ))
        ],
      )),
    );
  }
}
