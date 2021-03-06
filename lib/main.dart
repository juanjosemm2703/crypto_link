import 'package:crypto_link/domain/controller/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';
import 'domain/controller/chat_controller.dart';
import 'domain/controller/location_controller.dart';
import 'domain/controller/post_controller.dart';
import 'domain/controller/user_controller.dart';
import 'ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  Get.put(UserController());
  Get.put(PostController());
  Get.put(ChatController());
  Get.put(LocationController());
  Workmanager().initialize(
    updatePositionInBackground,
  );
  runApp(const MyApp());
}

void updatePositionInBackground() async {
  Workmanager().executeTask((task, inputData) async {
    await Firebase.initializeApp();
    Get.put(LocationController());
    LocationController controllerLocation = Get.find();
    await controllerLocation.backgroundLocation();
    return Future.value(true);
  });
}
