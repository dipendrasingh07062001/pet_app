import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pet_app/Api/Models/My_pet_model.dart';
import 'package:pet_app/Api/Prefrence.dart';
import 'package:pet_app/Api/Services.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/HOME/Home.dart';
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
  var id;

  @override
  void initState() {
    super.initState();
    id = Preference.Pref.getInt('userId');
    getLoginStatus();
    if (id != null) {
      mypetApi().then((value) {
        mypetmoellist = value;
        Preference.Pref.getInt("selectedPetId") ??
            Preference.Pref.setInt("selectedPetId", value[0].id);

        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: WHITE70_CLR,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(SPLASH_LOGO),
          ),
        ));
  }

  getLoginStatus() {
    Future.delayed(const Duration(seconds: 2), () {
      id.toString() == "" || id.toString() == "null" || id == null
          ? Navigate_PushRemove(context, const Login())
          : Navigate_PushRemove(context, const Home());
    });
  }
}
