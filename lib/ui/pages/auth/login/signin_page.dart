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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.51,
                  height: MediaQuery.of(context).size.height * 0.24,
                  child: SvgPicture.asset(
                      'assets/undraw_access_account_re_8spm.svg')),
            ),
            inputRegister(
                paddingHeight: 0.00,
                text: "Enter your email",
                controller: emailController),
            inputRegister(
                paddingHeight: 0.07,
                text: "Enter password",
                controller: passwordController),
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
              child: TextButton(
                onPressed: widget.onViewSwitch,
                child: Text('Forgot Password',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    )),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: () {
                  Get.offNamed('/content');
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
