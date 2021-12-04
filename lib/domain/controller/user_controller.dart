import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_link/data/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var user = <User>[].obs;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  Future addUserData(
      String name, String profilePic, String email, String uid) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'profilePic': profilePic,
      'email': email,
    });
  }

  updateUserData(String uid) async {
    user.clear();
    final DocumentReference _user =
        FirebaseFirestore.instance.collection('user').doc(uid);
    await _user.get().then((value) => {user.add(User.fromSnapshot(value))});
    print(user.length);
  }

  updateUserDataBySignUp(User _user) {
    user.clear();
    user.add(_user);
    print(user.length);
  }

  List<User> get data => user;
}
