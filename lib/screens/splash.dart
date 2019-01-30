import 'dart:async';

import 'package:flutter/material.dart';
import 'package:Liste/screens/homePage.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash>{

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/main');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(29, 161, 243, 1.0),
      body: Container(
          alignment: Alignment.bottomCenter,
          child:  new Image.asset('assets/images/splashimage.png'),
        ),
    );
  }

}

