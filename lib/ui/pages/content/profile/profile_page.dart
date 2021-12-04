import 'package:crypto_link/domain/controller/user_controller.dart';
import 'package:crypto_link/ui/pages/content/profile/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ProfileScreen> {
  final items = List<String>.generate(20, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    UserController controllerUser = Get.find();

    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: CircleAvatar(
                  minRadius: 50.0,
                  maxRadius: 50.0,
                  backgroundImage:
                      NetworkImage(controllerUser.data[0].profilePic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                child: Text(controllerUser.data[0].name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Icon(Icons.location_on,
                          size: 18,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Text("Barranquilla, Colombia",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline3),
                  ],
                ),
              )
            ],
          ),
        ),
        ProfileCard(
          title: controllerUser.data[0].name,
          picUrl: controllerUser.data[0].profilePic,
          date: "21/11/2021",
          content: 'Me gustaria hablar hoy sobre criptomonedas',
        )
      ],
    );
  }
}
