import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Prefrence.dart';
import 'package:pet_app/Provider/Provider.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:provider/provider.dart';

import '../Api/SignupApi.dart';
import '../Componants/Images&Icons.dart';
import 'OTP_Verify.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailCantroller = TextEditingController();
  TextEditingController _passCantroller = TextEditingController();
  TextEditingController _confirmPassCantroller = TextEditingController();

  final verifyemail = Preference.Pref.getString('email');

  var h;
  var w;

  bool validate = false;

  valid() {
    validate = !validate;
  }

  bool _passwordVisible = false;
  bool _passwordVisible1 = false;

  String emailError = "";
  String passError = "";
  String passError1 = "";

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (BuildContext context) => ProviderTutorial(),
      child: Scaffold(
        backgroundColor: GREEN_CLR,
        resizeToAvoidBottomInset: true,
        extendBody: false,
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(children: [
                  Image.asset(BACK_GROUND_IMAGE,
                      height: h * 0.47,
                      width: w * 1,
                      color: WHITE70_CLR,
                      fit: BoxFit.cover),
                  Container(
                    height: h * 0.6,
                    color: WHITE70_CLR,
                  )
                ]),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * 0.1,
                      ),
                      Image.asset(
                        SIGN_UP_IMAGE,
                      ),
                      SizedBox(
                        height: h * 0.020,
                      ),
                      styleText(HELLO, WHITE70_CLR, FontWeight.normal, 21),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          padding: EdgeInsets.only(top: h * 0.020),
                          alignment: Alignment.topCenter,
                          height: h * 0.78,
                          width: w * 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24)),
                              color: WHITE70_CLR),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: w * 0.030, right: w * 0.030),
                            child: Column(
                              children: [
                                styleText(CREATE_ACCOUNT, BLACK_CLR,
                                    FontWeight.bold, 19),
                                Container(
                                  height: h * 0.06,
                                  margin: EdgeInsets.only(top: h * 0.030),
                                  decoration: BoxDecoration(
                                      color: WHITE70_CLR,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 14,
                                            color: SHADOW_CLR.withOpacity(0.1))
                                      ]),
                                  // color: WHITE_CLR,

                                  child: TextFormField(
                                      controller: _emailCantroller,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      textAlign: TextAlign.start,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          emailError = ENTER_EMAIL;
                                          return "";
                                        } else {
                                          emailError = "";
                                        }
                                      },
                                      decoration: InputDecoration(
                                          errorText: "",
                                          errorStyle: TextStyle(height: 0),
                                          hintText: "Email address",
                                          hintStyle: TextStyle(
                                              color: GRAY_CLR,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal),
                                          prefixIcon: Icon(
                                            Icons.email_outlined,
                                            color: GRAY_CLR,
                                            size: 20,
                                          ),
                                          border: InputBorder.none)),
                                ),
                                Visibility(
                                    visible: emailError != "",
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          emailError,
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 12),
                                        ))),
                                Container(
                                  height: h * 0.06,
                                  margin: EdgeInsets.only(top: h * 0.020),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: WHITE70_CLR,
                                      boxShadow: [
                                        BoxShadow(
                                            color: SHADOW_CLR.withOpacity(0.1),
                                            blurRadius: 14)
                                      ]),
                                  child: TextFormField(
                                    controller: _passCantroller,
                                    obscureText: _passwordVisible,
                                    textCapitalization: TextCapitalization.none,
                                    textAlign: TextAlign.start,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        passError = ENTER_PASS;
                                        return "";
                                      } else {
                                        passError = "";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        errorStyle: TextStyle(height: 0),
                                        errorText: "",
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
                                              _passwordVisible =
                                                  !_passwordVisible;
                                            });
                                          },
                                        )),
                                  ),
                                ),
                                Visibility(
                                    visible: passError != "",
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          passError,
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 12),
                                        ))),
                                Container(
                                  height: h * 0.06,
                                  margin: EdgeInsets.only(top: h * 0.020),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: SHADOW_CLR.withOpacity(0.1),
                                          blurRadius: 14)
                                    ],
                                    color: WHITE70_CLR,
                                  ),
                                  child: TextFormField(
                                    controller: _confirmPassCantroller,
                                    obscureText: _passwordVisible1,
                                    textCapitalization: TextCapitalization.none,
                                    textAlign: TextAlign.start,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        passError1 = ENTER_CONFIRM_PASS;

                                        return "";
                                      } else if (_passCantroller.text !=
                                          _confirmPassCantroller.text) {
                                        valid();

                                        passError1 =
                                            "Confirm Password doesn't match!";

                                        print(validate);
                                        return "";
                                      } else {
                                        passError1 = "";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        errorStyle: TextStyle(height: 0),
                                        errorText: "",
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
                                              _passwordVisible1 =
                                                  !_passwordVisible1;
                                            });
                                          },
                                        )),
                                  ),
                                ),
                                Visibility(
                                    visible: passError1 != "",
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          passError1,
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 12),
                                        ))),
                                SizedBox(
                                  height: h * 0.040,
                                ),
                                Consumer(builder: (BuildContext context, value,
                                    Widget? child) {
                                  return DefaultButton(
                                      text: SIGN_UP,
                                      ontap: () {
                                        if (_formkey.currentState!.validate()) {
                                          Sinup(
                                                  _emailCantroller.text
                                                      .toString(),
                                                  _passCantroller.text
                                                      .toString(),
                                                  _confirmPassCantroller.text
                                                      .toString())
                                              .then((value) {
                                            _emailCantroller.clear();
                                            _passCantroller.clear();
                                            _confirmPassCantroller.clear();
                                            Navigate_to(context, OPT_VERIFY());
                                          }).catchError((e) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    backgroundColor: GREEN_CLR,
                                                    content:
                                                        Text(e.toString())));
                                            print(e.toString());
                                          });
                                        }
                                      },
                                      fontsize: 16,
                                      height: h * 0.062,
                                      width: w * 1);
                                }),
                                SizedBox(
                                  height: h * 0.010,
                                ),
                                styleText(Or_Continue, GREEN_CLR,
                                    FontWeight.normal, 15),
                                SizedBox(
                                  height: h * 0.015,
                                ),
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 45,
                                        width: 45,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: WHITE_CLR,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Image.asset(
                                            GOOGLE_ICON,
                                            height: 40,
                                          ),
                                        )),
                                    Container(
                                        height: 45,
                                        width: 45,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                          left: 15,
                                        ),
                                        decoration: BoxDecoration(
                                            color: WHITE_CLR,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Icon(
                                          Icons.apple,
                                          size: 35,
                                        )),
                                    Container(
                                        height: 45,
                                        width: 45,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                          left: 15,
                                        ),
                                        decoration: BoxDecoration(
                                            color: WHITE_CLR,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Image.asset(
                                          'assets/png_icon/fb_icon_325x325.png',
                                          height: 30,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.015,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    styleText(ALLREADY_ACCOUNT, GRAY_CLR,
                                        FontWeight.normal, 15),
                                    Consumer<ProviderTutorial>(builder:
                                        (BuildContext context, value,
                                            Widget? child) {
                                      return GestureDetector(
                                          onTap: () => ProviderTutorial()
                                              .NavigateLogin(context),
                                          child: styleText(LOGIN, GREEN_CLR,
                                              FontWeight.normal, 15));
                                    })
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
