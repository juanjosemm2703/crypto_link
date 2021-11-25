import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  final VoidCallback onViewSwitch;

  const SignUp({Key? key, required this.onViewSwitch}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<SignUp> {
  final fullName = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
              inputRegister(
                  paddingHeight: 0.07,
                  text: "Enter your full name",
                  controller: fullName),
              inputRegister(
                  paddingHeight: 0.07,
                  text: "Enter your email",
                  controller: emailController),
              inputRegister(
                  paddingHeight: 0.07,
                  text: "Enter password",
                  controller: passwordController),
              inputRegister(
                  paddingHeight: 0.07,
                  text: "Confirm password",
                  controller: confirmPassword),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.07),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                  ),
                  onPressed: () {},
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
        ));
  }

  Padding inputRegister(
      {required double paddingHeight,
      required String text,
      required TextEditingController controller}) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * paddingHeight),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              hintText: text,
              hintStyle: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: Colors.grey))),
    );
  }
}
