import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/Api/Prefrence.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/Onbording/ForgotPassword.dart';
import 'package:pet_app/Screens/Onbording/Login.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:pet_app/main.dart';
import '../../Api/Services.dart';
import '../../Componants/Images&Icons.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController newPasswordCantrolller = TextEditingController();

  TextEditingController confirmPasswordCantrolller = TextEditingController();
  final getEmail = Preference.Pref.getString('email');

  String passError = "";
  String newPassError = "";

  bool _passwordVisible = true;
  bool _passwordVisible1 = true;
  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
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
                      Navigate_PushRemove(context, const ForgotPassword());
                    },
                    child: const Align(
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
                      // height: h * 0.06,
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
                        controller: newPasswordCantrolller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            passError = ENTER_NEW_PASS;
                            setState(() {});
                            return "";
                          } else if (value.length < 6) {
                            passError = "Please enter at least 6 character";
                            setState(() {});
                            return "";
                          } else {
                            passError = "";
                            setState(() {});
                          }
                        },
                        obscureText: _passwordVisible,
                        textCapitalization: TextCapitalization.none,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              top: h * 0.02,
                              bottom: h * 0.02,
                            ),
                            errorText: "",
                            errorStyle: const TextStyle(height: 0),
                            hintText: "New Password",
                            hintStyle: const TextStyle(
                                color: GRAY_CLR,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                            prefixIcon: const Icon(
                              Icons.lock_open_outlined,
                              color: GRAY_CLR,
                              size: 20,
                            ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
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
                            style: const TextStyle(
                                color: Colors.red, fontSize: 12),
                            textAlign: TextAlign.start,
                          )),
                    ),
                    Container(
                      // height: h * 0.06,
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
                        controller: confirmPasswordCantrolller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            newPassError = ENTER_CONFIRM_PASS;
                            setState(() {});
                            return "";
                          } else if (newPasswordCantrolller.text !=
                              confirmPasswordCantrolller.text) {
                            newPassError = "Confirm Password doesn't match";
                            setState(() {});
                            return "";
                          } else {
                            newPassError = "";
                            setState(() {});
                          }
                        },
                        obscureText: _passwordVisible1,
                        textCapitalization: TextCapitalization.none,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              top: h * 0.02,
                              bottom: h * 0.02,
                            ),
                            errorText: "",
                            errorStyle: const TextStyle(height: 0),
                            hintText: "Confirm Password",
                            hintStyle: const TextStyle(
                                color: GRAY_CLR,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                            prefixIcon: const Icon(
                              Icons.lock_open_outlined,
                              color: GRAY_CLR,
                              size: 20,
                            ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                  _passwordVisible1
                                      ? Icons.visibility_off
                                      : Icons.visibility,
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
                            style: const TextStyle(
                                color: Colors.red, fontSize: 12),
                            textAlign: TextAlign.start,
                          )),
                    ),
                    SizedBox(
                      height: h * 0.040,
                    ),
                    isLoading == true
                        ? loader
                        : DefaultButton(
                            text: SUBMIT,
                            ontap: () async {
                              unfocus(context);

                              if (_formkey.currentState!.validate()) {
                                passError = "";
                                newPassError = "";
                                setState(() {
                                  isLoading = true;
                                });
                                await Reset_PasswordApi(
                                  getEmail.toString(),
                                  newPasswordCantrolller.text.toString(),
                                ).then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: GREEN_CLR,
                                          content: Text(
                                              "You have successfully changed your password")));
                                  Navigate_PushRemove(context, const Login());
                                }).catchError((e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: GREEN_CLR,
                                          content: Text(e.toString())));
                                });
                                setState(() {
                                  isLoading = false;
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
