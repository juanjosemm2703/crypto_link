import 'package:crypto_link/ui/pages/content/notifications/widgets/nofitication_post.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<NotificationScreen> {
  final items = List<String>.generate(20, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return const NotificationCard(
            title: 'Jesus David Infante ',
            picUrl:
                'https://image.shutterstock.com/image-photo/handsome-man-portrait-260nw-1266937855.jpg',
            content: "realizo un nuevo post.");
      },
    );
  }
}
