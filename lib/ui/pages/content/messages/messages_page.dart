import 'package:crypto_link/ui/pages/content/messages/widgets/appbar_messages.dart';
import 'package:crypto_link/ui/pages/content/messages/widgets/body_messages.dart';
import 'package:crypto_link/ui/widgets/background.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  String picUrl, name;
  bool isActivate;

  Messages({
    Key? key,
    required this.picUrl,
    required this.name,
    required this.isActivate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        key: const Key('contentPage'),
        fit: StackFit.expand,
        children: <Widget>[
          CustomPaint(
              painter: BackgroundPainter(
                  fondo: Theme.of(context).colorScheme.background,
                  blur: Theme.of(context).colorScheme.primary)),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBarMessages(
              picUrl: picUrl,
              name: name,
              isActive: isActivate,
              context: context,
            ),
            body: BodyMessages(
              picUrl: picUrl,
            ),
          ),
        ]);
  }
}
