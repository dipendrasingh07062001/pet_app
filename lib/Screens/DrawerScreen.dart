import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/FirebaseServices/GoogleAuth.dart';
import 'package:pet_app/Screens/Onbording/Login.dart';
import 'package:pet_app/UTILS/Utils.dart';
import '../Api/ApiBaseUrl.dart';
import '../Api/Prefrence.dart';
import '../Api/Services.dart';
import 'My_Pets/My_Pets.dart';
import 'Profile.dart';
import 'Setting.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  // final deleteUser = Preference.Pref.clear();

  String? username;
  String? useremail;
  String? userimage;

  @override
  void initState() {
    super.initState();

    username = Preference.Pref.getString('name');
    userimage = Preference.Pref.getString('image');
    useremail = Preference.Pref.getString('email');
  }

  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      backgroundColor: GREEN_CLR,
      child: DrawerHeader(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: BackButton(
                    color: WHITE70_CLR,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                SizedBox(
                  height: h * 0.040,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(googlesigning == false
                          ? gprofilePic.toString()
                          : Preference.Pref.getString('image') ?? ""),
                    ),
                    SizedBox(
                      width: w * 0.020,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          googlesigning
                              ? gname.toString()
                              : Preference.Pref.getString('name') == ""
                                  ? "Hello.."
                                  : Preference.Pref.getString('name') ?? "",
                          style:
                              const TextStyle(color: WHITE60_CLR, fontSize: 12),
                        ),
                        Text(
                          googlesigning
                              ? gemail.toString()
                              : Preference.Pref.getString('email') ?? "",
                          style:
                              const TextStyle(color: WHITE60_CLR, fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.06,
                ),
                Row(
                  children: [
                    SvgPicture.asset(HOME_ICON),
                    const SizedBox(
                      width: 10,
                    ),
                    styleText(HOME, WHITE60_CLR, FontWeight.normal, 15),
                  ],
                ),
                SizedBox(
                  height: h * 0.025,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigate_to(context, const My_Pets());
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(PET_ICON),
                      const SizedBox(
                        width: 10,
                      ),
                      styleText(MY_PET, WHITE60_CLR, FontWeight.normal, 15),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.025,
                ),
                Row(
                  children: [
                    SvgPicture.asset(PROFILE_ICON),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigate_to(context, Profile1());
                        },
                        child: styleText(
                            PROFILE, WHITE60_CLR, FontWeight.normal, 15)),
                  ],
                ),
                SizedBox(
                  height: h * 0.025,
                ),
                Row(
                  children: [
                    SvgPicture.asset(HEALTH_ICON),
                    const SizedBox(
                      width: 10,
                    ),
                    styleText(
                        HEALTH_SUPPORT, WHITE60_CLR, FontWeight.normal, 15),
                  ],
                ),
                SizedBox(
                  height: h * 0.025,
                ),
                Row(
                  children: [
                    SvgPicture.asset(DOCT_ICON),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          showdialog(context);
                        },
                        child: styleText(UPLOAD_DOCUMENT, WHITE60_CLR,
                            FontWeight.normal, 15)),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: h * 0.050),
              child: Row(
                children: [
                  SvgPicture.asset(SETTING_ICON),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigate_to(context, const Setting());
                      },
                      child: styleText(
                          SETTING, WHITE60_CLR, FontWeight.normal, 15)),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pop();
                        _Logout(context);
                      },
                      child: styleText(
                          LOGOUT, WHITE60_CLR, FontWeight.normal, 15)),
                  styleText(CANCEL, GREEN_CLR, FontWeight.normal, 17)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _Logout(BuildContext context) {
  var h;
  var w;

  h = MediaQuery.of(context).size.height;
  w = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Center(
              child:
                  TutorialText(LOGOUT_TITLE, BLACK_CLR, FontWeight.normal, 17),
            ),
            content: SizedBox(
              height: h * 0.12,
              width: w * 0.18,
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.010,
                  ),
                  DefaultButton(
                      text: LOGOUT,
                      ontap: () async {
                        Preference.Pref.clear().then((value) async {
                          Navigate_PushRemove(context, Login());
                          GoogleSignIn googleSignIn = GoogleSignIn();
                          await googleSignIn.signOut();

                          print(value.toString());
                        });
                      },
                      fontsize: 17,
                      height: 40,
                      width: 300),
                  const SizedBox(
                    height: 18,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child:
                          styleText(CANCEL, GREEN_CLR, FontWeight.normal, 17)),
                ],
              ),
            ),
          ),
        );
      });
}

showdialog(context) {
  var h;
  var w;

  h = MediaQuery.of(context).size.height;
  w = MediaQuery.of(context).size.width;
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: UploadDoc(),
      );
    },
  );
}

class UploadDoc extends StatefulWidget {
  const UploadDoc({super.key});

  @override
  State<UploadDoc> createState() => _UploadDocState();
}

class _UploadDocState extends State<UploadDoc> {
  var h;
  var w;
  XFile? selectImage;
  String picktype = "";
  bool issending = false;
  bool error = false;
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: h * 0.030),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: WHITE_CLR,
      ),
      width: w * 1,
      // height: h * 0.48,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            styleText(UPLOAD_DOCUMENT, DARK_CLR, FontWeight.bold, 17),
            Container(
              alignment: Alignment.centerLeft,
              height: h * 0.055,
              width: w * 0.82,
              margin: EdgeInsets.only(top: h * 0.020),
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: TFFBORDER_CLR)),
              child: TextFormField(
                controller: name,
                textAlign: TextAlign.start,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Document Name",
                    hintStyle: TextStyle(fontSize: 14, color: GRAY_CLR)),
              ),
            ),
            Visibility(
              visible: error && name.text.isEmpty,
              child: styleText(
                "Please enter documet name.",
                Colors.red,
                FontWeight.w400,
                14,
              ),
            ),
            GestureDetector(
              onTap: () {
                askwhich();
              },
              child: Container(
                  alignment: Alignment.center,
                  height: h * 0.15,
                  width: w * 0.82,
                  margin: EdgeInsets.only(top: h * 0.020),
                  decoration: BoxDecoration(
                      color: WHITE70_CLR,
                      image: selectImage == null
                          ? null
                          : DecorationImage(
                              image: FileImage(
                                File(selectImage!.path),
                              ),
                              fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: TFFBORDER_CLR)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(UPLOAD_ICON),
                      SizedBox(
                        height: h * 0.015,
                      ),
                      styleText(UPLOAD, GRAY_CLR, FontWeight.normal, 14),
                    ],
                  )),
            ),
            Visibility(
              visible: error && selectImage == null,
              child: styleText(
                "Please pick document.",
                Colors.red,
                FontWeight.w400,
                14,
              ),
            ),
            Visibility(
                visible: picktype == "doc" && selectImage != null,
                child: styleText(
                  selectImage != null ? selectImage!.name : "",
                  GREEN_CLR,
                  FontWeight.normal,
                  12,
                )),
            SizedBox(
              height: h * 0.025,
            ),
            issending
                ? loader
                : DefaultButton(
                    text: SUBMIT,
                    ontap: () {
                      if (name.text.isEmpty || selectImage == null) {
                        setState(() {
                          error = true;
                        });
                        return;
                      }
                      setState(() {
                        error = false;
                        issending = true;
                      });
                      editDocument(
                        name.text,
                        File(selectImage!.path),
                        context,
                      ).then((value) {
                        if (value) {
                          setState(() {
                            issending = false;
                          });
                        }
                      });

                      // Navigator.of(context).pop();
                    },
                    fontsize: 17,
                    height: h * 0.05,
                    width: w * 0.5),
            SizedBox(
              height: h * 0.025,
            ),
            GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: styleText(CANCEL, GREEN_CLR, FontWeight.normal, 17)),
            SizedBox(
              height: h * 0.02,
            ),
          ],
        ),
      ),
    );
  }

  Future askwhich() async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Column(
              children: [
                Text(
                  "Pick one options",
                  style: TextStyle(color: BLACK_CLR),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: GREEN_CLR,
                          padding: EdgeInsets.all(8),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                          await pickimageFile().then((value) {
                            if (value != null) {
                              selectImage = XFile(value);
                            }
                          });
                          setState(() {
                            picktype = "image";
                          });
                        },
                        child: Text(
                          "Image",
                          style: TextStyle(color: WHITE_CLR),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: GREEN_CLR,
                          padding: EdgeInsets.all(8),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                          await pickdocFile().then((value) {
                            if (value != null) {
                              selectImage = XFile(value);
                            }
                          });
                          setState(() {
                            picktype = "doc";
                          });
                        },
                        child: Text(
                          "Document",
                          style: TextStyle(color: WHITE_CLR),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
