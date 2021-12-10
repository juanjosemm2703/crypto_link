import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_link/ui/pages/content/messages/messages_page.dart';
import 'package:crypto_link/ui/pages/content/online/widgets/onlinechat_cards.dart';
import 'package:crypto_link/data/models/online_people.dart';

import 'package:flutter/material.dart';

class OnlinePeopleScreen extends StatefulWidget {
  const OnlinePeopleScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<OnlinePeopleScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('user/')
            .where('isActive', isEqualTo: true)
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
              return OnlineCard(
                  title: data['name'],
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Messages(
                                  isActivate: data['isActive'],
                                  name: data['name'],
                                  picUrl: data['profilePic'],
                                )));
                  },
                  picUrl: data['profilePic'],
                  isActive: data['isActive']);
            }).toList(),
          );
        });
  }
}
