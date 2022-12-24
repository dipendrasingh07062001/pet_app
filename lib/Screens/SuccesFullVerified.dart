import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/HOME/Home.dart';
import 'package:pet_app/Screens/Onbording/Login.dart';
import 'package:pet_app/UTILS/Utils.dart';
import '../Componants/Images&Icons.dart';

class SuccessFullyVerified extends StatefulWidget {
  const SuccessFullyVerified({super.key});

  @override
  State<SuccessFullyVerified> createState() => _SuccessFullyVerifiedState();
}

class _SuccessFullyVerifiedState extends State<SuccessFullyVerified> {
  final _formkey = GlobalKey<FormState>();

  String emailError = "";
  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        pushPage(context, const Login());
        return false;
        // moveToScreen2(context);
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: WHITE70_CLR,
        body: Container(
          padding:
              EdgeInsets.only(top: h * 0.20, left: w * 0.050, right: w * 0.050),
          alignment: Alignment.center,
          height: h * 1,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(
                    height: h * 0.2,
                    width: w * 0.5,
                    child: SvgPicture.asset(
                      SUCCESSFULLY_IMAGE,
                    )),
                SizedBox(
                  height: h * 0.05,
                ),
                styleText(HURRAY, BLACK70_CLR, FontWeight.bold, 19),
                SizedBox(
                  height: h * 0.020,
                ),
                TutorialText(
                    SUCCESSFULLY_TITLE, GRAY_CLR, FontWeight.normal, 15),
                SizedBox(
                  height: h * 0.040,
                ),
                DefaultButton(
                    text: GO_TO_DASHBOARD,
                    ontap: () {
                      Navigate_PushRemove(context, const Home());
                    },
                    fontsize: 18,
                    height: h * 0.060,
                    width: w * 1),
              ]),
        ),
      ),
    );
  }
}

Future<T?> pushPage<T>(BuildContext context, Widget page) {
  return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false);
}
