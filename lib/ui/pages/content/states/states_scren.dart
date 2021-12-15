import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_link/domain/controller/auth_controller.dart';
import 'package:crypto_link/domain/controller/post_controller.dart';
import 'package:crypto_link/domain/controller/user_controller.dart';
import 'package:crypto_link/ui/pages/content/states/widgets/state_card.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatesScreen extends StatefulWidget {
  const StatesScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<StatesScreen> {
  AuthController controllerAuth = Get.find();
  PostController controllerPost = Get.find();
  UserController controllerUser = Get.find();
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _postsStream = controllerPost.snapshotPosts();

    return StreamBuilder<QuerySnapshot>(
        stream: _postsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;

            return StreamBuilder<QuerySnapshot>(
                stream: controllerUser.snapshotUserByName(data['name']),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return Text('Error = ${snapshot.error}');

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  dynamic user =
                      snapshot.data!.docs[0].data() as Map<String, dynamic>;
                  return StateCard(
                      title: (data['name']),
                      content: (data['message']),
                      picUrl: (user['profilePic']),
                      onDelete: () {
                        controllerPost.deletePost(document.id);
                      },
                      date: (data['date']));
                });
          }).toList());
        });
  }
}
