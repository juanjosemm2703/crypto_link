import 'package:crypto_link/ui/widgets/card.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String title, content, picUrl, date;

  // StateCard constructor
  const ProfileCard(
      {Key? key,
      required this.title,
      required this.content,
      required this.picUrl,
      required this.date})
      : super(key: key);

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: title,
      content: Text(
        content,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      // topLeftWidget widget as an Avatar
      topLeftWidget: SizedBox(
        height: 48.0,
        width: 48.0,
        child: Center(
          child: CircleAvatar(
            minRadius: 14.0,
            maxRadius: 14.0,
            backgroundImage: NetworkImage(picUrl),
          ),
        ),
      ),
      // topRightWidget widget as an IconButton
      extraContent: Text(
        date,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
