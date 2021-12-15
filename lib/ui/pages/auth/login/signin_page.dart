import 'package:crypto_link/domain/controller/auth_controller.dart';
import 'package:crypto_link/domain/controller/user_controller.dart';
import 'package:crypto_link/ui/widgets/widget_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  final VoidCallback onViewSwitch;

  const SignIn({Key? key, required this.onViewSwitch}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SignIn> {
  AuthController controllerAuth = Get.find();
  UserController controllerUser = Get.find();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // Que hace la variable GlobalKey
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

  _inicio(theEmail, thePassword) async {
    print('_login $theEmail $thePassword');
    try {
      await controllerAuth.logIn(theEmail, thePassword);
      await controllerUser.updateUserData(controllerAuth.getUid());
      await controllerUser.changeUserState(true, controllerAuth.getUid());
      Get.toNamed('/content');
    } catch (err) {
      print("estoy aca");
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
            child: Column(children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Text("Welcome Back!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.51,
                    height: MediaQuery.of(context).size.height * 0.24,
                    child: SvgPicture.asset(
                        'assets/undraw_access_account_re_8spm.svg')),
              ),
              WidgetTextField(
                  key: const Key('email'),
                  paddingHeight: 0.00,
                  text: "Enter your email",
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Por favor ingrese su E-mail.";
                    } else if (!isEmail(value)) {
                      return "Por favor ingrese un E-mail valido.";
                    }
                  }),
              WidgetTextField(
                key: const Key('password'),
                obscure: true,
                paddingHeight: 0.07,
                text: "Enter password",
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese su Contrasena.";
                  } else if (!characters(value)) {
                    return "Se requieren minimo 6 caracteres";
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password',
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                child: ElevatedButton(
                  key: const Key('logInButton'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                  ),
                  onPressed: () {
                    final form = _formKey.currentState;
                    form!.save();
                    if (form.validate()) {
                      _inicio(_emailController.text, _passwordController.text);
                    } else {
                      Get.snackbar(
                        "Error",
                        "Ha ocurrido un error al ingresar",
                      );
                    }
                  },
                  child: Text('Login',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text("Don't have an account?",
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.headline3),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: TextButton(
                      key: const Key('switchLogOut'),
                      onPressed: widget.onViewSwitch,
                      child: Text('Sign Up',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          )),
                    ),
                  ),
                ],
              )
            ]),
          )),
    );
  }
}
