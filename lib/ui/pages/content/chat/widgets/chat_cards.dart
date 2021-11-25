import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final String title, picUrl, content;

  // StateCard constructor
  const ChatCard(
      {Key? key,
      required this.title,
      required this.picUrl,
      required this.content})
      : super(key: key);

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(
            top: 4.0, bottom: 10.0, left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 70.0,
                  width: 80.0,
                  child: Center(
                    child: CircleAvatar(
                      minRadius: 30.0,
                      maxRadius: 30.0,
                      backgroundImage: NetworkImage(picUrl),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        title,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        content,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
