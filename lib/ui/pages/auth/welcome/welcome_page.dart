import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatefulWidget {
  final VoidCallback onViewSwitch;

  const WelcomeScreen({Key? key, required this.onViewSwitch}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.51,
            height: MediaQuery.of(context).size.height * 0.24,
            child: SvgPicture.asset('assets/undraw_mobile_ux_re_59hr.svg')),
        const SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07),
          child: Column(children: <Widget>[
            Text("The best blockchain comunnity ",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 20),
            Text(
                "A powerful social network to share, track and know the best knowledges about blockchain and crypto currency. ",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1),
          ]),
        ),
        const SizedBox(height: 20),
        Flexible(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.1,
                  left: MediaQuery.of(context).size.width * 0.07,
                  right: MediaQuery.of(context).size.width * 0.07),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: widget.onViewSwitch,
                child: Text('Get Started',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1),
              )),
        )),
      ],
    );
  }
}
