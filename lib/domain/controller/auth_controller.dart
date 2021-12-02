import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signUp(dynamic _email, dynamic _passw, dynamic username) async {
    try {
      UserCredential usuario = await auth.createUserWithEmailAndPassword(
          email: _email, password: _passw);
      print(usuario);
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('Correo ya Existe');
        return Future.error('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> logIn(dynamic email, dynamic pass) async {
    try {
      UserCredential usuario =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Correo no encontrado');
        return Future.error('User Not Found');
      } else if (e.code == 'wrong-password') {
        print('Password incorrecto');
        return Future.error('Wrong Password');
      }
    }
  }

  Future<void> logOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      return Future.error(e.toString());
    }
  }

  String userEmail() {
    String email = auth.currentUser!.email ?? "a@a.com";
    return email;
  }

  String getUid() {
    String uid = auth.currentUser!.uid;
    return uid;
  }
}
