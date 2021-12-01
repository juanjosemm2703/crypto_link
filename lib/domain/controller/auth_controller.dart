import 'package:get/get.dart';

class AuthController extends GetxController {
  final _authController = false.obs;

  bool get authController => _authController.value;

  logIn() {
    _authController.value = true;
  }

  logOut() {
    _authController.value = false;
  }
}
