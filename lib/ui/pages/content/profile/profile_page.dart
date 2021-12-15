import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_link/domain/controller/auth_controller.dart';
import 'package:crypto_link/domain/controller/location_controller.dart';
import 'package:crypto_link/domain/controller/user_controller.dart';
import 'package:crypto_link/ui/pages/content/profile/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ProfileScreen> {
  File? file;

  chooseImage() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (xfile == null) {
      file == null;
    } else {
      file = File(xfile.path);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    UserController controllerUser = Get.find();
    AuthController controllerAuth = Get.find();
    LocationController controllerLocation = Get.find();
    final uid = controllerAuth.getUid();
    final Stream<QuerySnapshot> _postsStream = FirebaseFirestore.instance
        .collection('post/')
        .where('uid', isEqualTo: uid)
        .orderBy('date', descending: true)
        .snapshots();
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: InkWell(
                onTap: () async {
                  await chooseImage();
                  file != null
                      ? print(file!.path)
                      : print("No se escogio una foto");
                },
                child: Stack(children: [
                  CircleAvatar(
                    minRadius: 50.0,
                    maxRadius: 50.0,
                    backgroundImage: file == null
                        ? NetworkImage(controllerUser.data[0].profilePic)
                        : Image.file(file!, fit: BoxFit.cover).image,
                  ),
                  Positioned(
                      right: 5,
                      bottom: 5,
                      child: Container(
                          color: Theme.of(context).colorScheme.background,
                          height: 16,
                          width: 16,
                          child: Icon(Icons.photo_library_sharp,
                              color: Theme.of(context).colorScheme.primary)))
                ]),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.3,
                  vertical: MediaQuery.of(context).size.height * 0.02),
              child: ElevatedButton(
                onPressed: () async {
                  file != null
                      ? await controllerUser.updateProfilePic(
                          controllerAuth.getUid(),
                          file: file!)
                      : const GetSnackBar(
                          title: 'Choose a pic',
                        );
                  setState(() {});
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.upload_file),
                    Text('Update Photo')
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                ),
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
                  Text(
                      controllerLocation.city +
                          " , " +
                          controllerLocation.country,
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
                          picUrl: controllerUser.user[0].profilePic,
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
