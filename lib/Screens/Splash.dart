import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/GetStart.dart';
import 'package:pet_app/Screens/Tutorial.dart';

import '../Componants/Images&Icons.dart';
import '../UTILS/Utils.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

   var h;
   var w;


   @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 3000), ()=>Navigate_to(context, Tutorial()));
  }


  @override
  Widget build(BuildContext context) {

    h  = MediaQuery.of(context).size.height;
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