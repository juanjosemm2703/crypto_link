import 'package:crypto_link/ui/pages/content/online/widgets/onlinechat_cards.dart';

import 'package:flutter/material.dart';

class OnlinePeopleScreen extends StatefulWidget {
  const OnlinePeopleScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<OnlinePeopleScreen> {
  final items = List<String>.generate(20, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return const OnlineCard(
            title: 'Camilo Diaz',
            picUrl:
                'https://thumbs.dreamstime.com/b/handsome-man-smiling-cheerful-big-smile-face-showing-teeth-positive-happy-expression-handsome-man-smiling-cheerful-212902822.jpg',
            estado: "Available");
      },
    );
  }
}
