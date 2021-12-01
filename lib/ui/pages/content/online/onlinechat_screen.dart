import 'package:crypto_link/ui/pages/content/messages/messages_page.dart';
import 'package:crypto_link/ui/pages/content/online/widgets/onlinechat_cards.dart';
import 'package:crypto_link/data/models/online_people.dart';

import 'package:flutter/material.dart';

class OnlinePeopleScreen extends StatefulWidget {
  const OnlinePeopleScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<OnlinePeopleScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: onlinePeopleData.length,
      itemBuilder: (context, index) {
        return OnlineCard(
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Messages(
                            isActivate: onlinePeopleData[index].isActive,
                            name: onlinePeopleData[index].name,
                            picUrl: onlinePeopleData[index].image,
                          )));
            },
            title: onlinePeopleData[index].name,
            picUrl: onlinePeopleData[index].image,
            isActive: onlinePeopleData[index].isActive);
      },
    );
  }
}
