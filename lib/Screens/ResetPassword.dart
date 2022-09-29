import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:pet_app/Api/ApiBaseUrl.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/Login.dart';
import 'package:pet_app/Screens/SuccesFullVerified.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:provider/provider.dart';

import '../Api/Reset_PasswordApi.dart';
import '../Componants/Images&Icons.dart';
import '../Prefrence.dart';
import '../Provider/Provider.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _newPasswordCantrolller = TextEditingController();

  TextEditingController _ConfirmPasswordCantrolller = TextEditingController();
  final getEmail = Preference.Pref.getString('email');

  String passError = "";
  String newPassError = "";

  bool _passwordVisible = false;
  bool _passwordVisible1 = false;
  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: WHITE70_CLR,
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            height: h * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: h * 0.1, left: w * 0.035),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: CircleAvatar(
                          backgroundColor: FADE_GREEN_CLR,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 18,
                            color: WHITE70_CLR,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: h * 0.050, left: w * 0.075, right: w * 0.075),
                  child: Column(children: [
                    SizedBox(
                        height: h * 0.25,
                        width: w * 0.8,
                        child: SvgPicture.asset(CHANGE_PASS_IMAGE)),
                    SizedBox(
                      height: h * 0.040,
                    ),
                    styleText(RESET_PASWORD, BLACK_CLR, FontWeight.bold, 19),
                    Container(
                      height: h * 0.06,
                      margin: EdgeInsets.only(top: h * 0.025),
                      decoration: BoxDecoration(
                          color: WHITE70_CLR,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: SHADOW_CLR.withOpacity(0.1),
                                blurRadius: 14)
                          ]),
                      // color: WHITE_CLR,

                      child: TextFormField(
                        controller: _newPasswordCantrolller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            passError = ENTER_NEW_PASS;
                            setState(() {});
                            return "";
                          } else {
                            passError = "";
                          }
                        },
                        obscureText: _passwordVisible,
                        textCapitalization: TextCapitalization.none,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            errorText: "",
                            errorStyle: TextStyle(height: 0),
                            hintText: "New Password",
                            hintStyle: TextStyle(
                                color: GRAY_CLR,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                            prefixIcon: Icon(
                              Icons.lock_open_outlined,
                              color: GRAY_CLR,
                              size: 20,
                            ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: GRAY_CLR),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                          visible: passError != "",
                          child: Text(
                            passError,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                            textAlign: TextAlign.start,
                          )),
                    ),
                    Container(
                      height: h * 0.06,
                      margin: EdgeInsets.only(top: h * 0.025),
                      decoration: BoxDecoration(
                          color: WHITE70_CLR,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: SHADOW_CLR.withOpacity(0.1),
                                blurRadius: 14)
                          ]),
                      // color: WHITE_CLR,

                      child: TextFormField(
                        controller: _ConfirmPasswordCantrolller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            newPassError = ENTER_CONFIRM_PASS;
                            setState(() {});
                            return "";
                          } else if (_ConfirmPasswordCantrolller !=
                              _newPasswordCantrolller) {
                            newPassError = ENTER_CONFIRM_PASS_DOES_NOT_MATCH;
                            setState(() {});
                          } else {
                            newPassError = "";
                          }
                        },
                        obscureText: _passwordVisible1,
                        textCapitalization: TextCapitalization.none,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            errorText: "",
                            errorStyle: TextStyle(height: 0),
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(
                                color: GRAY_CLR,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                            prefixIcon: Icon(
                              Icons.lock_open_outlined,
                              color: GRAY_CLR,
                              size: 20,
                            ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                  _passwordVisible1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: GRAY_CLR),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible1 = !_passwordVisible1;
                                });
                              },
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                          visible: newPassError != "",
                          child: Text(
                            newPassError,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                            textAlign: TextAlign.start,
                          )),
                    ),
                    SizedBox(
                      height: h * 0.040,
                    ),
                    DefaultButton(
                        text: SUBMIT,
                        ontap: () {
                          if (_formkey.currentState!.validate()) {
                            passError = "";
                            newPassError = "";

                            Reset_PasswordApi(
                              getEmail.toString(),
                              _newPasswordCantrolller.text.toString(),
                            ).then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: GREEN_CLR,
                                      content: Text(resetmsg.toString())));
                              Navigate_to(context, SuccessFullyVerified());
                            }).catchError((e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: GREEN_CLR,
                                      content: Text(e.toString())));
                            });
                          }
                        },
                        fontsize: 18,
                        height: h * 0.060,
                        width: w * 1),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
