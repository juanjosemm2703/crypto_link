import 'package:crypto_link/domain/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'domain/controller/user_controller.dart';
import 'ui/app.dart';

void main() {
  Get.put(AuthController());
  Get.put(UserController());
  runApp(const MyApp());
}
