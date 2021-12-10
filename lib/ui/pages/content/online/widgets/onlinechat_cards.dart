import 'package:flutter/material.dart';

class OnlineCard extends StatelessWidget {
  final String title, picUrl;
  final bool isActive;
  final VoidCallback press;

  // StateCard constructor
  const OnlineCard(
      {Key? key,
      required this.title,
      required this.picUrl,
      required this.isActive,
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
                        // if (isActive)
                        Row(
                          children: [
                            Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  color: isActive ? Colors.green : Colors.grey,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            isActive
                                ? Text("Online",
                                    style:
                                        Theme.of(context).textTheme.headline3)
                                : Text("Offline",
                                    style:
                                        Theme.of(context).textTheme.headline3),
                          ],
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
