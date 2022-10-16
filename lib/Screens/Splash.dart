import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pet_app/Api/Prefrence.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/HOME/Home.dart';
import 'package:pet_app/Screens/Tutorial.dart';
import '../Componants/Images&Icons.dart';
import '../UTILS/Utils.dart';
import 'Onbording/Login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  var userExist = false;
  var h;
  var w;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getLoginStatus();
    // getLoginStatus();
    // Timer(Duration(milliseconds: 4500),
    //     () => Navigate_replace(context, Tutorial()));
  }

  int? id;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: WHITE70_CLR,
        body: Center(
          child: FadeTransition(
            opacity: _controller,
            child: SlideTransition(
              position: _offsetAnimation,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(SPLASH_LOGO),
              ),
            ),
          ),
        ));
  }

  getLoginStatus() {
    id = Preference.Pref.getInt('id');
    var firstTime;
    firstTime = Preference.Pref.getBool("isFirstTimeUser") ?? true;
    if (firstTime) {
      Preference.Pref.setBool('isFirstTimeUser', false);
    }
    print("id :" + id.toString() + "^");

    Future.delayed(const Duration(seconds: 2), () {
      id.toString() == "" || id.toString() == "null" || id == ''
          ? Navigate_PushRemove(context, Login())
          : Navigate_PushRemove(context, Home());
    });
  }
}
