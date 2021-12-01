import 'package:crypto_link/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

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
              const Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    hintText: 'Type Message', border: InputBorder.none),
              )),
              IconButton(
                  onPressed: () {},
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
