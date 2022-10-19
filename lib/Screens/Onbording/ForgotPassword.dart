import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/Api/Services.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/Screens/Onbording/ForgotPassOTP_Verify.dart';
import 'package:pet_app/Screens/Onbording/Login.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:pet_app/main.dart';
import '../../Provider/Provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController emailCantroller = TextEditingController();
  bool isEmail(String input) => EmailValidator.validate(input);

  String emailError = "";
  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      // resizeToAvoidBottomInset: false,
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
                      Navigate_PushRemove(context, const Login());
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
                SizedBox(
                  height: h * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.075, right: w * 0.075),
                  child: Column(children: [
                    SizedBox(
                        height: h * 0.2,
                        width: w * 0.5,
                        child: SvgPicture.asset(
                          FORGOT_PASS_IMAGE,
                        )),
                    SizedBox(
                      height: h * 0.058,
                    ),
                    styleText(FORGOT_PASS, BLACK_CLR, FontWeight.bold, 19),
                    Container(
                      height: h * 0.065,
                      margin: EdgeInsets.only(top: h * 0.028),
                      decoration: BoxDecoration(
                        color: WHITE70_CLR,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: SHADOW_CLR.withOpacity(0.1)),
                        ],
                      ),
                      child: TextFormField(
                          controller: emailCantroller,
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
                            }
                          },
                          textCapitalization: TextCapitalization.none,
                          textAlign: TextAlign.start,
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
                    SizedBox(
                      height: h * 0.035,
                    ),
                    isLoading == true
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: GREEN_CLR,
                          ))
                        : DefaultButton(
                            text: FORGOT_PASS,
                            ontap: () async {
                              unfocus(context);

                              if (_formkey.currentState!.validate()) {
                                emailError = "";
                                setState(() {
                                  isLoading = true;
                                });
                                await ForgotPasswordApi(
                                        emailCantroller.text.toString())
                                    .then((value) {
                                  Navigate_to(context,
                                      const ForgotPassword_OTP_Verify());
                                  emailCantroller.clear();
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
                    SizedBox(
                      height: h * 0.040,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        styleText(
                            ALLREADY_ACCOUNT, GRAY_CLR, FontWeight.normal, 15),
                        GestureDetector(
                            onTap: () {
                              ProviderTutorial().NavigateLogin(context);
                            },
                            child: styleText(
                                LOGIN, GREEN_CLR, FontWeight.normal, 15))
                      ],
                    )
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
