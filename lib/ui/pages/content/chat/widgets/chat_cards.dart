import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final String title, picUrl, content;
  final bool isActive;
  final VoidCallback press;
  // StateCard constructor
  const ChatCard(
      {Key? key,
      required this.isActive,
      required this.title,
      required this.picUrl,
      required this.content,
      required this.press})
      : super(key: key);

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Card(
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
                      child: Stack(
                        children: [
                          CircleAvatar(
                            minRadius: 30.0,
                            maxRadius: 30.0,
                            backgroundImage: NetworkImage(picUrl),
                          ),
                          if (isActive)
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor)),
                              ),
                            )
                        ],
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
      ),
    );
  }
}
