import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Provider/Provider.dart';
import 'package:pet_app/Screens/Onbording/Login.dart';
import 'package:pet_app/Screens/Onbording/SignupOTP_Verify.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:pet_app/main.dart';
import 'package:provider/provider.dart';
import '../../Api/Services.dart';
import '../../Componants/Images&Icons.dart';
import '../../FirebaseServices/GoogleAuth.dart';
import '../HOME/Home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController emailCantroller = TextEditingController();
  TextEditingController passCantroller = TextEditingController();
  TextEditingController confirmPassCantroller = TextEditingController();

  var h;
  var w;

  bool _passwordVisible = true;
  bool _passwordVisible1 = true;

  String emailError = "";
  String passError = "";
  String passError1 = "";

  bool isEmail(String input) => EmailValidator.validate(input);

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (BuildContext context) => ProviderTutorial(),
      child: Scaffold(
        backgroundColor: GREEN_CLR,
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
                          decoration: const BoxDecoration(
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
                                      // autovalidateMode: AutovalidateMode.always,
                                      controller: emailCantroller,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      textAlign: TextAlign.start,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          emailError = "Please enter email";
                                          setState(() {});
                                          return "";
                                        } else if (!isEmail(value)) {
                                          emailError =
                                              "Please enter a valid email";
                                          setState(() {});
                                          return "";
                                        } else {
                                          emailError = "";
                                          setState(() {});
                                        }
                                      },
                                      decoration: const InputDecoration(
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
                                          style: const TextStyle(
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
                                    controller: passCantroller,
                                    obscureText: _passwordVisible,
                                    textCapitalization: TextCapitalization.none,
                                    textAlign: TextAlign.start,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        passError = ENTER_PASS;
                                        setState(() {});
                                      } else if (value.length < 6) {
                                        passError =
                                            "Please enter at least 6 character";
                                        setState(() {});
                                        return "";
                                      } else {
                                        passError = "";
                                        setState(() {});
                                      }
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        errorStyle: const TextStyle(height: 0),
                                        errorText: "",
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
                                          style: const TextStyle(
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
                                    controller: confirmPassCantroller,
                                    obscureText: _passwordVisible1,
                                    textCapitalization: TextCapitalization.none,
                                    textAlign: TextAlign.start,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        passError1 = ENTER_CONFIRM_PASS;
                                        setState(() {});
                                        return "";
                                      } else if (passCantroller.text !=
                                          confirmPassCantroller.text) {
                                        passError1 =
                                            "Confirm Password doesn't match";
                                        setState(() {});
                                        return "";
                                      } else {
                                        passError1 = "";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        errorStyle: const TextStyle(height: 0),
                                        errorText: "",
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
                                          style: const TextStyle(
                                              color: Colors.red, fontSize: 12),
                                        ))),
                                SizedBox(
                                  height: h * 0.040,
                                ),
                                Consumer(builder: (BuildContext context, value,
                                    Widget? child) {
                                  return isLoading == true
                                      ? loader
                                      : DefaultButton(
                                          text: SIGN_UP,
                                          ontap: () {
                                            setState(() async {
                                              unfocus(context);
                                              if (_formkey.currentState!
                                                  .validate()) {
                                                setState(() {
                                                  isLoading = true;
                                                });
                                                await Sinup(
                                                        emailCantroller.text
                                                            .toString(),
                                                        passCantroller.text
                                                            .toString(),
                                                        confirmPassCantroller
                                                            .text
                                                            .toString())
                                                    .then((value) {
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                  emailCantroller.clear();
                                                  passCantroller.clear();
                                                  confirmPassCantroller.clear();
                                                  Navigate_to(context,
                                                      const Signup_OTP_Verify());
                                                }).catchError((e) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          backgroundColor:
                                                              GREEN_CLR,
                                                          content: Text(
                                                              e.toString())));
                                                  print(e.toString());
                                                });
                                                setState(() {
                                                  isLoading = false;
                                                });
                                              }
                                            });
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
                                    GestureDetector(
                                      onTap: () async {
                                        setState(() {
                                          googlesigning = true;
                                        });

                                        googleLogin().then((value) {
                                          if (value) {
                                            socialSigningApi(
                                              gemail.toString(),
                                              gname.toString(),
                                              "Google",
                                            ).then((value) {
                                              setState(() {
                                                Navigate_PushRemove(
                                                  context,
                                                  const Home(),
                                                );
                                                googlesigning = false;
                                              });
                                            }).catchError((e) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          GREEN_CLR,
                                                      content:
                                                          Text(e.toString())));
                                              setState(() {
                                                googlesigning = false;
                                              });
                                            });
                                          }
                                        });
                                        setState(() {
                                          googlesigning = false;
                                        });
                                      },
                                      child: Container(
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
                                    ),
                                    Container(
                                        height: 45,
                                        width: 45,
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(
                                          left: 15,
                                        ),
                                        decoration: BoxDecoration(
                                            color: WHITE_CLR,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: const Icon(
                                          Icons.apple,
                                          size: 35,
                                        )),
                                    Container(
                                        height: 45,
                                        width: 45,
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(
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
                                          onTap: () => Navigate_replace(
                                              context, const Login()),
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
