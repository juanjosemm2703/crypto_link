import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_link/domain/controller/auth_controller.dart';
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
    AuthController controllerAuth = Get.find();
    final uid = controllerAuth.getUid();
    final Stream<QuerySnapshot> _postsStream = FirebaseFirestore.instance
        .collection('post/')
        .where('uid', isEqualTo: uid)
        .snapshots();
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: SingleChildScrollView(
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
                        size: 18, color: Theme.of(context).colorScheme.primary),
                  ),
                  Text("Barranquilla, Colombia",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline3),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: _postsStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return Text('Error = ${snapshot.error}');

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  return ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return ProfileCard(
                          title: (data['name']),
                          content: (data['message']),
                          picUrl: (data['picUrl']),
                          date: (data['date']));
                    }).toList(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
