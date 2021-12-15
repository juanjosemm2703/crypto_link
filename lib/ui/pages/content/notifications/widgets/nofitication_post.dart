import 'package:crypto_link/ui/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationCard extends StatelessWidget {
  final String title, content, picUrl;
  final dynamic latitude, longitude;

  // StateCard constructor
  const NotificationCard({
    Key? key,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.content,
    required this.picUrl,
  }) : super(key: key);

  Widget getIconButton(primaryColor, latitude, longitude) {
    return IconButton(
        onPressed: () async {
          final url = "https://www.google.es/maps?q=$latitude,$longitude";
          await launch(url);
        },
        icon: Icon(
          Icons.gps_fixed_sharp,
          color: primaryColor,
        ));
  }

  // We create a Stateless widget that contais an AppCard,
  // Passing all the customizable views as parameters
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
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
      topRightWidget: getIconButton(primaryColor, latitude, longitude),
      // topRightWidget widget as an IconButton
    );
  }
}
