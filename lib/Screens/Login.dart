import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/Provider/LoginProvider.dart';
import 'package:pet_app/Provider/Provider.dart';
import 'package:pet_app/Screens/HOME/Home.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:provider/provider.dart';
import 'ForgotPassword.dart';
import 'Signup.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

 final  _formkey= GlobalKey<FormState>();

 TextEditingController _emailCantroller =TextEditingController();
 TextEditingController _passwordCantrolller = TextEditingController();

 String emailError = "";
 String passError = "";

  var h;
  var w;

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    // final formProvider = Provider.of<LoginProvider>(context);

    return ChangeNotifierProvider<ProviderTutorial>(
      create: (BuildContext context)=>ProviderTutorial(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: false,
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(children: [
                  Container(
                    height: h * 0.6,
                    width: w * 1,
                    color: GREEN_CLR,
                    child: SvgPicture.asset(
                      BACK_GROUND_IMAGE,
                      fit: BoxFit.none,
                    ),
                  ),
                  Container(
                    height: h * 0.5,
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
                        padding: EdgeInsets.only(top: h * 0.030),
                        alignment: Alignment.topCenter,
                        height: h * 0.8,
                        width: w * 1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24)),
                            color: WHITE70_CLR),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.030, right: w * 0.030, top: h * 0.010),
                          child: Column(
                            children: [
                      
                              styleText(WELCOME_BACK,
                                  BLACK_CLR, FontWeight.bold, 19),
                              Container(
                      
                                height: h*0.07,
                                margin: EdgeInsets.only(top: h * 0.035),
                            decoration: BoxDecoration(
                        
                              color: WHITE70_CLR,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(blurRadius: 14,color: SHADOW_CLR.withOpacity(0.2)),
                                
                              ],
                              
                            ),
                                child: TextFormField(
                                  controller: _emailCantroller,
                                  validator: (value){
                                    if(value!.isEmpty){
                                        emailError = "Please enter correct email";
                                        setState(() {
                                    
                                        });
                                       return "";
                                    }else{
                                      emailError="";
                                    }
                                  },


                                  // validator: (value){
                                  // formProvider.validEmail(value);
                                  // },
                                  
                                    textCapitalization: TextCapitalization.none,
                                    textAlign: TextAlign.start,
                                    
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

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Visibility(
                                  visible: emailError!="",
                                  child: Text(emailError,style: TextStyle(color: Colors.red,fontSize: 12),textAlign: TextAlign.start,)),
                              ),
                             

                              Container(
                                height: h*0.07,
                                margin: EdgeInsets.only(top: h * 0.025),
                                decoration: BoxDecoration(
                                  color: WHITE70_CLR,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(color: SHADOW_CLR.withOpacity(0.2),blurRadius: 14)
                                    ]
                                    ),
                                // color: WHITE_CLR,
                                
                                child: TextFormField(
                                  controller: _passwordCantrolller,
                                  validator: (value){
                                    if(value!.isEmpty){

                                      passError ="Please enter password";
                                      setState(() {
                                        
                                      });
                                      return "";
                                    }
                                    else{
                                      passError="";
                                    }
                                  },
                                  //  validator: (value){
                                  //   formProvider.validPassword(value);
                                  //  },
                                 
                                
                                  obscureText: _passwordVisible,
                                  textCapitalization: TextCapitalization.none,
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    errorText: "",
                                    errorStyle: TextStyle(height: 0),
                                      hintText: "Password",
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
                                visible: passError!="",
                                child: Text(passError,style: TextStyle(color: Colors.red,fontSize: 12),)),
                             ),

                              SizedBox(
                                height: h*0.010,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.key_sharp,
                                    color: GRAY_CLR,
                                  ),
                                  SizedBox(
                                    width: w * 0.005,
                                  ),
                                  GestureDetector(
                                    onTap: ()=>Navigate_to(context, ForgotPassword()),
                                    child: styleText(FORGOT_PASSWORD, NON_DARK_CLR,
                                        FontWeight.normal, 15),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: h * 0.040,
                              ),
                              DefaultButton(
                                  text: "Login",
                                  ontap: () {
                                
                                   if(_formkey.currentState!.validate()){
                                     emailError="";
                                    passError="";
                                    
                                    setState(() {
                                      
                                    });
                                   Navigate_to(context, Home());
                                   }
                                  
          
                                  },
                                  fontsize: 16,
                                  height: h * 0.060,
                                  width: w * 1),
                              SizedBox(
                                height: h * 0.015,
                              ),
                              styleText("Or Continue with", GREEN_CLR,
                                  FontWeight.normal, 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(GOOGLE_IMAGE),
                                  Image.asset(APPLE_IMAGE),
                                  Image.asset(FACEBOOK_IMAGE),
                                ],
                              ),



                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  styleText(NOT_MEMBER, GRAY_CLR,
                                      FontWeight.normal, 15),
          
                                  Consumer<ProviderTutorial>(
                                    builder: (BuildContext context, value, Widget? child) {
                                      return
                                        TextButton(
                                            onPressed: () {
                                              // formProvider.globalKey.currentState!.validate();

                                              ProviderTutorial().NavigateSinup(context);
                                              
                                            },
                                           
                                            child: styleText(
                                               REGISTER_NOW, GREEN_CLR,
                                                FontWeight.normal, 15));
          
                                    }
                                  )
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
      ),
    );
  }
}
