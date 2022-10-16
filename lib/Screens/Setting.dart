import 'package:flutter/material.dart';
import 'package:pet_app/Screens/Onbording/ChangePassword1.dart';
import 'package:pet_app/Screens/Onbording/Login.dart';
import '../Api/Prefrence.dart';
import '../Colors/COLORS.dart';
import '../Componants/Images&Icons.dart';
import '../UTILS/Utils.dart';
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
        appBar: DefaultAppBar(SETTING1),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigate_to(context, Help1());
                },
                child: SizedBox(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        styleText(ABOUT_US, BLACK_CLR, FontWeight.bold, 14),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
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
                onTap: () {
                  Navigate_to(context, ChangePassword1());
                },
                child: SizedBox(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        styleText(
                            CHANGE_PASSWORD, BLACK_CLR, FontWeight.bold, 14),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
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
                onTap: () {
                  // Navigate_to(context, widget);
                },
                child: SizedBox(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        styleText(HELP_SUPPORT, BLACK_CLR, FontWeight.bold, 14),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
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
                onTap: () {
                  Preference.Pref.clear().then((value) {
                    Navigate_PushRemove(context, Login());
                  });
                },
                child: SizedBox(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        styleText(LOGOUT, BLACK_CLR, FontWeight.bold, 14),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
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
        ));
  }
}
