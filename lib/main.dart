import 'package:flutter/material.dart';
import 'package:Liste/screens/about.dart';
import 'package:Liste/screens/homePage.dart';
import 'package:Liste/screens/nasilKullanilir.dart';
import 'package:Liste/screens/settings.dart';
import 'package:Liste/screens/splash.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Splash(),
        "/main": (context) => HomePage(),
        "/about" : (context) => About(),
        "/nasilkullanilir" : (context) => NasilKullanilir(),
        "/settings" : (context) => Settings(),
      },
    ),
  );
}

