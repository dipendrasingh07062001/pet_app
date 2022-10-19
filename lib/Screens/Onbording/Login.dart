import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/Provider/Provider.dart';
import 'package:pet_app/Screens/HOME/Home.dart';
import 'package:pet_app/Screens/Onbording/Signup.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:pet_app/main.dart';
import 'package:provider/provider.dart';
import '../../Api/Services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController emailCantroller = TextEditingController();
  TextEditingController passwordCantroller = TextEditingController();

  String emailError = "";
  String passError = "";

  var h;
  var w;

  bool _passwordVisible = true;
  bool isEmail(String input) => EmailValidator.validate(input);

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: GREEN_CLR,
      resizeToAvoidBottomInset: false,
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
                  height: h * 0.625,
                  color: WHITE70_CLR,
                )
              ]),
              Column(
                children: [
                  SizedBox(
                    height: h * 0.2,
                  ),
                  styleText(HELLO_AGAIN, WHITE70_CLR, FontWeight.normal, 21),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      padding: EdgeInsets.only(top: h * 0.028),
                      alignment: Alignment.topCenter,
                      height: h * 0.8,
                      width: w * 1,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24)),
                          color: WHITE70_CLR),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: w * 0.030,
                          right: w * 0.030,
                        ),
                        child: Column(
                          children: [
                            TutorialText(
                                WELCOME_BACK, BLACK_CLR, FontWeight.bold, 19),
                            Container(
                              height: h * 0.06,
                              margin: EdgeInsets.only(top: h * 0.030),
                              decoration: BoxDecoration(
                                color: WHITE70_CLR,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 14,
                                      color: SHADOW_CLR.withOpacity(0.1)),
                                ],
                              ),
                              child: TextFormField(
                                controller: emailCantroller,
                                textAlign: TextAlign.start,
                                decoration: const InputDecoration(
                                    errorText: "",
                                    errorStyle: TextStyle(height: 0),
                                    hintText: "Email Address",
                                    hintStyle: TextStyle(
                                        color: GRAY_CLR,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: GRAY_CLR,
                                      size: 22,
                                    ),
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    emailError = "Please enter email";
                                    setState(() {});
                                    return "";
                                  } else if (!isEmail(value)) {
                                    emailError = "Please enter a valid email";
                                    setState(() {});
                                    return "";
                                  } else {
                                    emailError = "";
                                    // setState(() {});
                                  }
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Visibility(
                                  visible: emailError != "",
                                  child: Text(
                                    emailError,
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
                                controller: passwordCantroller,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    passError = ENTER_NEW_PASS;
                                    // setState(() {});
                                    return "";
                                  } else if (value.length < 6) {
                                    passError =
                                        "Please enter at least 6 character";
                                    setState(() {});
                                  } else {
                                    passError = "";
                                  }
                                },

                                obscureText: _passwordVisible,
                                // textCapitalization: TextCapitalization.none,
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                    errorText: "",
                                    errorStyle: const TextStyle(height: 0),
                                    hintText: "Password",
                                    hintStyle: const TextStyle(
                                        color: GRAY_CLR,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                    prefixIcon: const Icon(
                                      Icons.lock_open_outlined,
                                      color: GRAY_CLR,
                                      size: 22,
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
                                  )),
                            ),
                            SizedBox(
                              height: h * 0.010,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  Passsword_Key,
                                  color: GRAY_CLR,
                                ),
                                SizedBox(
                                  width: w * 0.005,
                                ),
                                Consumer<ProviderTutorial>(builder:
                                    (BuildContext context, value,
                                        Widget? child) {
                                  return GestureDetector(
                                    onTap: () {
                                      value.NavigateForgotPassword(context);
                                    },
                                    child: styleText(FORGOT_PASSWORD,
                                        NON_DARK_CLR, FontWeight.normal, 15),
                                  );
                                })
                              ],
                            ),
                            SizedBox(
                              height: h * 0.030,
                            ),
                            Consumer<ProviderTutorial>(builder:
                                (BuildContext context, value, Widget? child) {
                              return isLoading == true
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                      color: GREEN_CLR,
                                    ))
                                  : DefaultButton(
                                      text: "Login",
                                      ontap: () async {
                                        unfocus(context);
                                        if (_formkey.currentState!.validate()) {
                                          emailError = "";
                                          passError = "";
                                          unfocus(context);

                                          setState(() {
                                            isLoading = true;
                                          });
                                          await LoginApi(
                                                  emailCantroller.text
                                                      .toString(),
                                                  passwordCantroller.text
                                                      .toString())
                                              .then((value) {
                                            emailCantroller.clear();
                                            passwordCantroller.clear();
                                            Navigate_PushRemove(
                                                context, Home());
                                            setState(() {
                                              isLoading = false;
                                            });
                                          }).catchError((e) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    backgroundColor: GREEN_CLR,
                                                    content:
                                                        Text(e.toString())));

                                            print(e.toString());
                                          });

                                          setState(() {
                                            isLoading = false;
                                          });
                                        }
                                      },
                                      fontsize: 16,
                                      height: h * 0.060,
                                      width: w * 1);
                            }),
                            SizedBox(
                              height: h * 0.015,
                            ),
                            styleText(
                                Or_Continue, GREEN_CLR, FontWeight.normal, 15),
                            SizedBox(
                              height: h * 0.010,
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
                              height: h * 0.020,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                styleText(NOT_MEMBER, GRAY_CLR,
                                    FontWeight.normal, 15),
                                Consumer<ProviderTutorial>(builder:
                                    (BuildContext context, value,
                                        Widget? child) {
                                  return GestureDetector(
                                      onTap: () {
                                        Navigate_replace(
                                            context, const Signup());
                                      },
                                      child: styleText(REGISTER_NOW, GREEN_CLR,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
