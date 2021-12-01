import 'package:crypto_link/data/models/chat_messages.dart';
import 'package:flutter/material.dart';

class OneMessage extends StatelessWidget {
  final ChatMessage message;
  final String picUrl;
  const OneMessage({Key? key, required this.message, required this.picUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(picUrl),
            ),
            const SizedBox(
              width: 15 / 2,
            )
          ],
          Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15 * 0.75, vertical: 15 / 2),
              child: Text(message.text),
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primary
                      .withOpacity(message.isSender ? 1 : 0.15),
                  borderRadius: BorderRadius.circular(30))),
        ],
      ),
    );
  }
}
