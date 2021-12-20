import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_link/domain/controller/auth_controller.dart';
import 'package:crypto_link/domain/controller/location_controller.dart';
import 'package:crypto_link/ui/pages/content/notifications/widgets/nofitication_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<NotificationScreen> {
  final items = List<String>.generate(20, (i) => "Item $i");
  LocationController controllerLocation = Get.find();
  AuthController controllerAuth = Get.find();
  late dynamic _locationStream;

  @override
  void initState() {
    _locationStream = controllerLocation.getLocations(controllerAuth.getUid());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _locationStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data != null) {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                if (data['latitude'] == null || data['latitude'] == "") {
                  return Container();
                }
                final dynamic latitude = double.parse(data['latitude']);
                final dynamic longitude = double.parse(data['longitude']);

                final dynamic distanceBetween = num.parse(controllerLocation
                    .getDistanceBetweenKm(
                        startLatitude:
                            double.parse(controllerLocation.locationlat),
                        startLongitude:
                            double.parse(controllerLocation.locationlo),
                        endLatitude: latitude,
                        endLongitude: longitude)
                    .toStringAsFixed(2));
                return NotificationCard(
                  title: (data['name']),
                  content: "$distanceBetween km",
                  picUrl: data['profilePic'],
                  latitude: data['latitude'],
                  longitude: data['longitude'],
                );
              }).toList(),
            );
          } else {
            return Center(child: Text("No hay datos"));
          }
        });
  }
}
