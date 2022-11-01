import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:pet_app/main.dart';
import '../../Api/Services.dart';
import '../../Componants/Images&Icons.dart';
import 'ResetPassword.dart';

class ForgotPassword_OTP_Verify extends StatefulWidget {
  const ForgotPassword_OTP_Verify({super.key});

  @override
  State<ForgotPassword_OTP_Verify> createState() =>
      _ForgotPassword_OTP_VerifyState();
}

class _ForgotPassword_OTP_VerifyState extends State<ForgotPassword_OTP_Verify> {
  final _formkey = GlobalKey<FormState>();

  // final getEmail = Preference.Pref.getString('email').toString();

  var h;
  var w;

  String? otp;

  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  TextEditingController fourth = TextEditingController();
  bool isloading = false;

  var tap = 0;
  var tap1 = 0;
  var tap2 = 0;
  var tap3 = 0;

  late FocusNode pin1FocusNode;
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  void previousField(String value, FocusNode focusNode) {
    if (value.length == 0) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      // extendBody: true,
      // resizeToAvoidBottomInset: false,
      backgroundColor: WHITE70_CLR,
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(
                  top: h * 0.1, left: w * 0.035, right: w * 0.035),
              alignment: Alignment.center,
              height: h * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
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
                  SizedBox(
                    height: h * 0.020,
                  ),
                  SizedBox(
                      height: h * 0.25,
                      width: w * 0.8,
                      child: SvgPicture.asset(ENTER_PASS_IMAGE)),
                  SizedBox(
                    height: h * 0.040,
                  ),
                  styleText(OTP_VERIFICATION, BLACK_CLR, FontWeight.bold, 19),
                  SizedBox(
                    height: h * 0.010,
                  ),
                  styleText(
                    ENTER_OTP_EMAIL,
                    GRAY_CLR,
                    FontWeight.normal,
                    15,
                  ),
                  Text(resendotpemail.toString(),
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          color: GREEN_CLR)),
                  SizedBox(
                    height: h * 0.030,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(0),
                            alignment: Alignment.center,
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: GREEN_CLR,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.5),
                              child: TextFormField(
                                controller: first,
                                focusNode: pin1FocusNode,
                                // autofocus: true,
                                // obscureText: false,
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 24, color: WHITE70_CLR),
                                keyboardType: TextInputType.number,

                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    counterText: "",
                                    filled: true,
                                    fillColor: GREEN_CLR,
                                    counterStyle: TextStyle(height: 0)),
                                onChanged: (value) {
                                  nextField(value, pin2FocusNode);
                                  //previousField(value, pin2FocusNode);
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: GREEN_CLR,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.5),
                              child: TextFormField(
                                  maxLength: 1,
                                  controller: second,
                                  focusNode: pin2FocusNode,
                                  obscureText: false,
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.white),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      counterText: "",
                                      filled: true,
                                      focusColor: GREEN_CLR,
                                      fillColor: GREEN_CLR,
                                      counterStyle: TextStyle(height: 0)),
                                  onChanged: (value) {
                                    // nextField(value, pin3FocusNode);

                                    if (value.toString().length == 0 &&
                                        tap2 == 0) {
                                      print("Print1");

                                      tap2 = 1;
                                    }
                                    if (value.toString().length > 0) {
                                      print("Print2");
                                      FocusScope.of(context)
                                          .requestFocus(pin3FocusNode);
                                    }
                                    if (value.toString().length == 0 &&
                                        tap2 == 1) {
                                      print("Print3");
                                      FocusScope.of(context)
                                          .requestFocus(pin1FocusNode);
                                    }
                                  }),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: GREEN_CLR,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.5),
                              child: TextFormField(
                                  maxLength: 1,
                                  controller: third,
                                  focusNode: pin3FocusNode,
                                  obscureText: false,
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.white),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      counterText: "",
                                      filled: true,
                                      focusColor: GREEN_CLR,
                                      fillColor: GREEN_CLR,
                                      counterStyle: TextStyle(height: 0)),
                                  onChanged: (value) {
                                    //nextField(value, pin4FocusNode);
                                    if (value.toString().length == 0 &&
                                        tap3 == 0) {
                                      tap3 = 1;
                                    }
                                    if (value.toString().length > 0) {
                                      FocusScope.of(context)
                                          .requestFocus(pin4FocusNode);
                                    }
                                    if (value.toString().length == 0 &&
                                        tap3 == 1) {
                                      FocusScope.of(context)
                                          .requestFocus(pin2FocusNode);
                                    }
                                  }),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: GREEN_CLR,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.5),
                              child: TextFormField(
                                maxLength: 1,
                                controller: fourth,
                                focusNode: pin4FocusNode,
                                obscureText: false,
                                style: const TextStyle(
                                    fontSize: 24, color: Colors.white),
                                keyboardType: TextInputType.number,
                                // textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    counterText: "",
                                    filled: true,
                                    focusColor: GREEN_CLR,
                                    fillColor: GREEN_CLR,
                                    counterStyle: TextStyle(height: 0)),
                                onChanged: (value) {
                                  // if (value.length == 1) {
                                  //   pin4FocusNode.unfocus();

                                  if (value.toString().length == 0 &&
                                      tap3 == 0) {
                                    tap3 = 1;
                                  }
                                  if (value.toString().length > 0) {
                                    FocusScope.of(context).unfocus();
                                  }
                                  if (value.toString().length == 0 &&
                                      tap3 == 1) {
                                    FocusScope.of(context)
                                        .requestFocus(pin3FocusNode);
                                  }
                                },
                              ),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: h * 0.030,
                  ),
                  styleText(
                    DONT_RECEIVE_OTP,
                    GRAY_CLR,
                    FontWeight.normal,
                    15,
                  ),
                  resendotploading
                      ? const LoadingBouncingLine.circle(
                          backgroundColor: GREEN_CLR,
                          size: 45.0,
                          duration: Duration(seconds: 2),
                          borderColor: GREEN_CLR)
                      : GestureDetector(
                          onTap: () async {
                            setState(() {
                              resendotploading = true;
                            });
                            await Resend_OTP_ForgotPassword().then((value) {
                              first.clear();
                              second.clear();
                              third.clear();
                              fourth.clear();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: GREEN_CLR,
                                      content: Text(resendOTPmsg.toString())));
                              setState(() {
                                resendotploading = false;
                              });
                            }).catchError((e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: GREEN_CLR,
                                      content: Text(e.toString())));
                              setState(() {
                                resendotploading = false;
                              });
                            });
                            setState(() {
                              resendotploading = false;
                            });
                          },
                          child: const Text(
                            RESEND,
                            style: TextStyle(color: GREEN_CLR, fontSize: 15),
                          )),
                  SizedBox(
                    height: h * 0.030,
                  ),
                  isLoadingforgotOtp
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: GREEN_CLR,
                        ))
                      : DefaultButton(
                          text: VERIFY,
                          ontap: () async {
                            unfocus(context);

                            if (_formkey.currentState!.validate()) {
                              if (first.text == "" ||
                                  second.text == "" ||
                                  third.text == "" ||
                                  fourth.text == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        elevation: 1,
                                        backgroundColor: GREEN_CLR,
                                        content: Text("Please enter OTP")));
                              } else {
                                setState(() {
                                  isLoadingforgotOtp = true;
                                });
                                await ForgotPass_OTP_VERIFY(
                                        (first.text.toString() +
                                            second.text.toString() +
                                            third.text.toString() +
                                            fourth.text.toString()))
                                    .then((value) {
                                  first.clear();
                                  second.clear();
                                  third.clear();
                                  fourth.clear();
                                  Navigate_replace(
                                      context, const ResetPassword());
                                  setState(() {
                                    isLoadingforgotOtp = false;
                                  });
                                }).catchError((e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: GREEN_CLR,
                                          content: Text(e.toString())));
                                  setState(() {
                                    isLoadingforgotOtp = false;
                                  });
                                });
                                setState(() {
                                  isLoadingforgotOtp = false;
                                });
                              }
                            }
                          },
                          fontsize: 18,
                          height: h * 0.060,
                          width: w * 0.85),
                ],
              )),
        ),
      ),
    );
  }
}
