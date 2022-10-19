import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:pet_app/main.dart';

import '../../Api/Services.dart';

class ChangePassword1 extends StatefulWidget {
  const ChangePassword1({super.key});

  @override
  State<ChangePassword1> createState() => _ChangePassword1State();
}

class _ChangePassword1State extends State<ChangePassword1> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController oldPasswordCantroller = TextEditingController();
  TextEditingController newPasswordCantrolller = TextEditingController();
  TextEditingController confirmPasswordCantrolller = TextEditingController();

  String passError = "";
  String newPassError = "";
  String confirmPassError = "";

  bool _passwordVisible = true;
  bool _passwordVisible1 = true;
  bool _passwordVisible2 = true;
  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
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
                      child: const Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: CircleAvatar(
                            backgroundColor: FADE_GREEN_CLR,
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 22,
                              color: WHITE70_CLR,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: h * 0.060, left: w * 0.075, right: w * 0.075),
                    child: Column(children: [
                      SizedBox(
                          height: h * 0.25,
                          width: w * 0.8,
                          child: SvgPicture.asset(CHANGE_PASS_IMAGE)),
                      SizedBox(
                        height: h * 0.040,
                      ),
                      styleText(
                          CHANGE_PASSWORD, BLACK_CLR, FontWeight.bold, 19),
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
                          controller: oldPasswordCantroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              newPassError = ENTER_OLD_PASS;
                              setState(() {});
                              return "";
                            } else {
                              newPassError = "";
                            }
                          },
                          obscureText: _passwordVisible,
                          textCapitalization: TextCapitalization.none,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              errorText: "",
                              errorStyle: const TextStyle(height: 0),
                              hintText: "Old Password",
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
                            visible: newPassError != "",
                            child: Text(
                              newPassError,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 12),
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
                          controller: newPasswordCantrolller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              passError = ENTER_NEW_PASS;
                              setState(() {});
                              return "";
                            } else if (value.length < 6) {
                              passError = "Enter password minimum 6 charactor";
                              setState(() {});
                            } else {
                              passError = "";
                            }
                          },
                          obscureText: _passwordVisible1,
                          textCapitalization: TextCapitalization.none,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
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
                            visible: passError != "",
                            child: Text(
                              passError,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 12),
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
                          controller: confirmPasswordCantrolller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              confirmPassError = ENTER_CONFIRM_PASS;
                              setState(() {});
                              return "";
                            } else if (confirmPasswordCantrolller !=
                                newPasswordCantrolller) {
                              confirmPassError =
                                  ENTER_CONFIRM_PASS_DOES_NOT_MATCH;
                              setState(() {});
                            } else {
                              confirmPassError = "";
                              setState(() {});
                            }
                          },
                          obscureText: _passwordVisible2,
                          textCapitalization: TextCapitalization.none,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
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
                                    _passwordVisible2
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: GRAY_CLR),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible2 = !_passwordVisible2;
                                  });
                                },
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Visibility(
                            visible: confirmPassError != "",
                            child: Text(
                              confirmPassError,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 12),
                              textAlign: TextAlign.start,
                            )),
                      ),
                      SizedBox(
                        height: h * 0.040,
                      ),
                      isLoading == true
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: GREEN_CLR,
                            ))
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

                                  await ChangePasswordApi(
                                          oldPasswordCantroller.text.toString(),
                                          confirmPasswordCantrolller.text
                                              .toString())
                                      .then((value) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor: GREEN_CLR,
                                            content: Text(
                                                changepasswordmsg.toString())));
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
                ]),
          ),
        ),
      ),
    );
  }
}
