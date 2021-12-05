import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_link/domain/controller/auth_controller.dart';
import 'package:crypto_link/ui/pages/content/content_page.dart';
import 'package:crypto_link/ui/pages/content/states/widgets/state_card.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatesScreen extends StatefulWidget {
  const StatesScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<StatesScreen> {
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    final uid = authController.getUid();
    final Stream<QuerySnapshot> _postsStream = FirebaseFirestore.instance
        .collection('post/$uid/messages')
        .orderBy('date', descending: true)
        .snapshots();

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
              return StateCard(
                  title: (data['name']),
                  content: (data['message']),
                  picUrl: (data['picUrl']),
                  onDelete: () {
                    // controllerPost.deletePost(index);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContentPage()),
                        (route) => false);
                  },
                  date: (data['date']));
            }).toList(),
          );
        });
  }
}
