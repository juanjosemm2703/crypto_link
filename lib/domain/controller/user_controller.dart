import 'package:crypto_link/data/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final RxList<User> _usersController = <User>[].obs;
  RxList<User> get usuarios => _usersController;

  createNewUser(id, name, picUrl) {
    User newUser = User(id: id, name: name, profilePic: picUrl);
    _usersController.add(newUser);
  }
}
