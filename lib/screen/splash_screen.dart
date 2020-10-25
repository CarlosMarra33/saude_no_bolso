import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'base_screen.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          backgroundColor: Color(0xFF1A8474),
          navigateAfterSeconds: BaseScreen(),
          loaderColor: Colors.transparent,
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 3 / 10,
          left: MediaQuery.of(context).size.width * 2.7 / 10,
          child: Container(
            height: MediaQuery.of(context).size.height * 4 / 10,
            child: Image.asset('assets/com nome.png'),
          ),
        )
      ],
    );
  }
}
