import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_link/data/models/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

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
      'uid': uid,
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

  updateProfilePic(uid, {required File file}) async {
    String url = await uploadImage(uid, file);
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .update({'profilePic': url});
    updateImage(url);
    // await updateUserData(uid);
  }

  updateImage(String url) {
    User _user = User(
        email: user[0].email,
        name: user[0].name,
        uid: user[0].uid,
        profilePic: url);
    user.clear();
    user.add(_user);
  }

  Future<String> uploadImage(String uid, file) async {
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref()
        .child("profile_pics")
        .child(uid + "_" + basename(file!.path))
        .putFile(file!);
    return taskSnapshot.ref.getDownloadURL();
  }

  clearUserData() {
    user.clear();
  }

  List<User> get data => user;
}
