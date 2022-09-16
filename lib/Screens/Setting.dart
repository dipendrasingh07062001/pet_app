import 'package:flutter/material.dart';
import 'package:pet_app/Screens/ChangePassword.dart';
import 'package:pet_app/Screens/Login.dart';

import '../Colors/COLORS.dart';
import '../UTILS/Utils.dart';
import 'ChangePassword1.dart';
import 'Help_1.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar("Setting"),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigate_to(context, Help1());
              },
              child: SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
 styleText("About Us", BLACK_CLR, FontWeight.bold, 14),
 Icon(Icons.arrow_forward_ios,size: 15,),
                    ],
                  
          ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: GRAY_CLR.withOpacity(0.4),
            ),
            GestureDetector(
              onTap: (){
                Navigate_to(context, ChangePassword1());
              },
              child: SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
 styleText("Change Password", BLACK_CLR, FontWeight.bold, 14),
 Icon(Icons.arrow_forward_ios,size: 15,),
                    ],
                  
          ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: GRAY_CLR.withOpacity(0.4),
            ),
            GestureDetector(
              onTap: (){
                // Navigate_to(context, widget);
              },
              child: SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
 styleText("Help & Support", BLACK_CLR, FontWeight.bold, 14),
 Icon(Icons.arrow_forward_ios,size: 15,),
                    ],
                  
          ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: GRAY_CLR.withOpacity(0.4),
            ),
            GestureDetector(
              onTap: (){
                Navigate_to(context, Login());
              },
              child: SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
 styleText("Logout", BLACK_CLR, FontWeight.bold, 14),
 Icon(Icons.arrow_forward_ios,size: 15,),
                    ],
                  
          ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: GRAY_CLR.withOpacity(0.4),
            ),

          ],
        ),
      )



    );
  }
}