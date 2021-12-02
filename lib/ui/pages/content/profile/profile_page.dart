import 'package:crypto_link/domain/controller/auth_controller.dart';
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
    AuthController controllerAuth = Get.find();
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: CircleAvatar(
                  minRadius: 50.0,
                  maxRadius: 50.0,
                  backgroundImage: NetworkImage(
                      'https://dq1eylutsoz4u.cloudfront.net/2016/08/24175451/how-to-get-a-good-profile-photo.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                child: Text(controllerAuth.userEmail(),
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
          title: controllerAuth.userEmail(),
          picUrl:
              'https://dq1eylutsoz4u.cloudfront.net/2016/08/24175451/how-to-get-a-good-profile-photo.jpg',
          date: "21/11/2021",
          content: 'Me gustaria hablar hoy sobre criptomonedas',
        )
      ],
    );
  }
}
