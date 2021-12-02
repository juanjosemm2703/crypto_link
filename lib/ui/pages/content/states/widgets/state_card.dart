import 'package:crypto_link/domain/controller/auth_controller.dart';
import 'package:crypto_link/ui/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateCard extends StatelessWidget {
  final String title, content, date;
  final String picUrl;
  final VoidCallback onDelete;

  // StateCard constructor
  const StateCard(
      {Key? key,
      required this.title,
      required this.content,
      required this.picUrl,
      required this.onDelete,
      required this.date})
      : super(key: key);

  Widget getIconButton(primaryColor) {
    AuthController controllerAuth = Get.find();
    if (controllerAuth.userEmail() == title) {
      return IconButton(
        icon: Icon(
          Icons.delete,
          color: primaryColor,
        ),
        onPressed: onDelete,
      );
    } else {
      return Container();
    }
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
      // topRightWidget widget as an IconButton
      topRightWidget: getIconButton(primaryColor),
      extraContent: Text(
        date,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
