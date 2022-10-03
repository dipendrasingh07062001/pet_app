import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Prefrence.dart';
import 'package:pet_app/Screens/HOME/Home.dart';
import 'package:pet_app/Screens/Login.dart';
import 'package:pet_app/Screens/Tutorial.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Api/LoginApi.dart';
import '../Componants/Images&Icons.dart';
import '../UTILS/Utils.dart';

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
    getLoginStatus();
    // Timer(Duration(milliseconds: 3000),
    //     () => Navigate_replace(context, userExist ? Home() : Tutorial()));
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

  getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = Preference.Pref.getInt("id").toString();
    var firstTime = true;
    firstTime = prefs.getBool("isFirstTimeUser") ?? true;
    print("id :" + id.toString() + "^");

    Future.delayed(Duration(seconds: 2), () {
      id.toString() == "" || id.toString() == "null" || id.toString() == ''
          ? firstTime != "null"
              ? firstTime
                  ? Navigate_replace(context, Tutorial())
                  : Navigate_replace(context, Login())
              : Navigate_replace(context, Home())
          : Navigate_replace(context, Home());
    });
  }
}
