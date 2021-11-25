import 'package:flutter/material.dart';
import 'widgets/state_card.dart';

class StatesScreen extends StatefulWidget {
  const StatesScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<StatesScreen> {
  final items = List<String>.generate(20, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return StateCard(
            title: 'Diana L. Vera O',
            content:
                'A powerful social network to share, track and know the best knowledges about blockchain and crypto currency.',
            picUrl:
                'https://dq1eylutsoz4u.cloudfront.net/2016/08/24175451/how-to-get-a-good-profile-photo.jpg',
            onChat: () => {},
            date: "21/11/2021");
      },
    );
  }
}
