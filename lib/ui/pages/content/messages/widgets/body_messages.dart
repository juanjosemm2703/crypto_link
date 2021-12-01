import 'package:crypto_link/data/models/chat_messages.dart';
import 'package:flutter/material.dart';

import 'chat_input_field.dart';
import 'one_message.dart';

class BodyMessages extends StatelessWidget {
  final String picUrl;
  const BodyMessages({Key? key, required this.picUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
              itemCount: giveMeChatMessages.length,
              itemBuilder: (context, index) => OneMessage(
                  message: giveMeChatMessages[index], picUrl: picUrl)),
        )),
        const ChatInputField(),
      ],
    );
  }
}
