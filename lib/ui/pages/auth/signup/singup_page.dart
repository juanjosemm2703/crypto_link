import 'package:crypto_link/data/models/user.dart';
import 'package:crypto_link/domain/controller/auth_controller.dart';
import 'package:crypto_link/domain/controller/user_controller.dart';
import 'package:crypto_link/ui/widgets/widget_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  final VoidCallback onViewSwitch;

  const SignUp({Key? key, required this.onViewSwitch}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SignUp> {
  AuthController controllerAuth = Get.find();
  UserController controllerUser = Get.find();
  final fullName = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isEmail(String em) {
    String p =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$";

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  bool characters(String e) {
    int length = e.length;
    if (length < 6) {
      return false;
    }
    return true;
  }

  _signUp(theEmail, thePassword, username) async {
    final _user = User(
        email: theEmail,
        name: username,
        profilePic:
            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png');
    print('_login $theEmail $thePassword $username');
    try {
      await controllerAuth.signUp(theEmail, thePassword, username);
      Get.toNamed('/content');
      await controllerUser.addUserData(
          username,
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
          theEmail,
          controllerAuth.getUid());

      await controllerUser.updateUserDataBySignUp(_user);
    } catch (err) {
      print(err.toString());
      Get.snackbar(
        "Login",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Text("Welcome Onboard!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1),
                const SizedBox(height: 20),
                Text("Come and join to the best blockchain Comunnity ",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2),
                WidgetTextField(
                  key: const Key('name'),
                  paddingHeight: 0.07,
                  text: "Enter your full name",
                  controller: fullName,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Por favor ingrese su Nombre Completo";
                    }
                  },
                ),
                WidgetTextField(
                  key: const Key('email'),
                  paddingHeight: 0.07,
                  text: "Enter your email",
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Por favor ingrese su E-mail.";
                    } else if (!isEmail(value)) {
                      return "Por favor ingrese un E-mail valido.";
                    }
                  },
                ),
                WidgetTextField(
                  key: const Key('password'),
                  obscure: true,
                  paddingHeight: 0.07,
                  text: "Enter password",
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Por favor ingrese una contrasena.";
                    } else if (!characters(value)) {
                      return "Se requieren minimo 6 caracteres";
                    }
                  },
                ),
                WidgetTextField(
                  key: const Key('confirmPassword'),
                  obscure: true,
                  paddingHeight: 0.07,
                  text: "Confirm password",
                  controller: confirmPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "La contrasena no concuerda.";
                    } else if (confirmPassword.text !=
                        passwordController.text) {
                      return "La contrasena no concuerda.";
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.07),
                  child: ElevatedButton(
                    key: const Key('registerButton'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(60),
                    ),
                    onPressed: () {
                      final form = _formKey.currentState;
                      form!.save();
                      if (form.validate()) {
                        _signUp(emailController.text, passwordController.text,
                            fullName.text);
                      } else {
                        Get.snackbar(
                          "Error",
                          "Ha ocurrido un error al ingresar",
                        );
                      }
                    },
                    child: Text('Register',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 2,
                      child: Text('Already have an account?',
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.headline3),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 1,
                      child: TextButton(
                        key: const Key('switchLogIn'),
                        onPressed: widget.onViewSwitch,
                        child: Text('Sign In',
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
