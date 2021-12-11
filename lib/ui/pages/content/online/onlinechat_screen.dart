import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_link/domain/controller/chat_controller.dart';
import 'package:crypto_link/domain/controller/user_controller.dart';
import 'package:crypto_link/ui/pages/content/messages/messages_page.dart';
import 'package:crypto_link/ui/pages/content/online/widgets/onlinechat_cards.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnlinePeopleScreen extends StatefulWidget {
  const OnlinePeopleScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<OnlinePeopleScreen> {
  ChatController controllerChat = Get.find();
  UserController controllerUser = Get.find();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('user/')
            .orderBy('isActive', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return data['name'] != controllerUser.data[0].name
                  ? OnlineCard(
                      title: data['name'],
                      press: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Messages(
                                      chatRoomId: controllerChat.getChatRoomId(
                                          controllerUser.user[0].name,
                                          data['name']),
                                      isActivate: data['isActive'],
                                      name: data['name'],
                                      picUrl: data['profilePic'],
                                    )));
                      },
                      picUrl: data['profilePic'],
                      isActive: data['isActive'])
                  : const SizedBox.shrink();
            }).toList(),
          );
        });
  }
}
