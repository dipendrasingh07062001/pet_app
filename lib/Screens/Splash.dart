import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Prefrence.dart';
import 'package:pet_app/Screens/Tutorial.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Componants/Images&Icons.dart';
import '../UTILS/Utils.dart';
import 'HOME/Home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var userExist = false;
  var h;
  var w;

  @override
  void initState() {
    super.initState();
    // _checkIfLoggedIn();
    Timer(Duration(milliseconds: 3000),
        () => Navigate_to(context, userExist ? Home() : Tutorial()));
  }

  void _checkIfLoggedIn() async {
    final userId = Preference.Pref.getInt('id').toString();
    if (userId != null) {
      setState(() {
        userExist = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: WHITE70_CLR,
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(SPLASH_LOGO),
      ),
    );
  }
}
