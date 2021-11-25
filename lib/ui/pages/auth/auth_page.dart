import 'package:crypto_link/ui/pages/auth/signup/singup_page.dart';
import 'package:crypto_link/ui/pages/auth/welcome/welcome_page.dart';
import 'package:crypto_link/ui/widgets/background.dart';
import 'package:flutter/material.dart';

import 'login/signin_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<AuthPage> {
  Widget? _content;

  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 1:
          _content = WelcomeScreen(
            onViewSwitch: () => _onItemTapped(2),
          );
          break;
        case 2:
          _content = SignUp(
            onViewSwitch: () => _onItemTapped(3),
          );
          break;
        case 3:
          _content = SignIn(
            onViewSwitch: () => _onItemTapped(2),
          );
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _content = WelcomeScreen(onViewSwitch: () => _onItemTapped(2));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: <Widget>[
      CustomPaint(
          painter: BackgroundPainter(
              fondo: Theme.of(context).colorScheme.background,
              blur: Theme.of(context).colorScheme.primary)),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500), child: _content),
        ),
      )
    ]);
  }
}
