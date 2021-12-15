import 'package:flutter/material.dart';

class OneMessage extends StatelessWidget {
  final String message;
  final bool isSender;
  final String picUrl;
  const OneMessage(
      {Key? key,
      required this.message,
      required this.picUrl,
      required this.isSender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(picUrl),
            ),
            const SizedBox(
              width: 15 / 2,
            )
          ],
          Container(
              constraints: BoxConstraints(
                  maxWidth: isSender
                      ? screenSize.width - 30
                      : screenSize.width - 30 - 24 - 15),
              padding: const EdgeInsets.symmetric(
                  horizontal: 15 * 0.75, vertical: 15 / 2),
              child: Text(message),
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primary
                      .withOpacity(isSender ? 1 : 0.15),
                  borderRadius: BorderRadius.circular(30))),
        ],
      ),
    );
  }
}
