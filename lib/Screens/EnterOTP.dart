import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/ChangePassword.dart';
import 'package:pet_app/Screens/SuccesFullVerified.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:provider/provider.dart';

import '../Provider/Provider.dart';
class EnterOTP extends StatefulWidget {
  const EnterOTP({super.key});

  @override
  State<EnterOTP> createState() => _EnterOTPState();
}

class _EnterOTPState extends State<EnterOTP> {

  final _formkey =GlobalKey<FormState>();

var h;
var w;



String? otp;

  TextEditingController first = new TextEditingController();
  TextEditingController second = new TextEditingController();
  TextEditingController third = new TextEditingController();
  TextEditingController fourth = new TextEditingController();
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
      extendBody: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: WHITE70_CLR,
   

 body: Form(
  key: _formkey,
   child: SingleChildScrollView(
     child: Container(
      padding: EdgeInsets.only(top: h*0.1,left: w*0.035,right: w*0.035),
      alignment: Alignment.center,
      height: h*1,
       child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [



            Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
            height:40,width: 40,
            child: CircleAvatar(
            
              backgroundColor: FADE_GREEN_CLR,
               child: Icon(Icons.arrow_back_ios_new,size: 22,color: WHITE70_CLR,),),
                  ),
          ),

          SizedBox(height: h*0.020,),
              SizedBox(
                height: h*0.25,
                width: w*0.8,
                child: SvgPicture.asset('assets/svg_image/6325249-ai.svg',)),
    
    
                SizedBox(
                  height: h*0.040,
                ),
    
             styleText("OTP Verification ", BLACK_CLR, FontWeight.bold, 19),
             SizedBox(
              height: h*0.010,
             ),


             styleText("Enter OTP code sent to your email ", GRAY_CLR,
                                        FontWeight.normal, 15,),

                                        Text("jkdesigner62@gmail.com", style: TextStyle(decoration: TextDecoration.underline,fontSize: 15,color: GREEN_CLR)
                                        ),
    
            


   SizedBox(height: h*0.030,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            height: 60,
            width: 60,
            child: TextFormField(
              controller: first,
              focusNode: pin1FocusNode,
              autofocus: true,
              obscureText: false,
              maxLength: 1,
              
              style: TextStyle(fontSize: 24, color:WHITE70_CLR),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
             decoration:    InputDecoration( 
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)),
  counterText: "",
  filled: true,
  focusColor: GREEN_CLR,
  fillColor: GREEN_CLR,
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  counterStyle: TextStyle(height: 0)),
              onChanged: (value) {

                nextField(value, pin2FocusNode);
                //previousField(value, pin2FocusNode);
              },
            ),
          ),

          Container(
          height: 60,
            width: 60,
            child: TextFormField(
              maxLength: 1,
                controller: second,
                focusNode: pin2FocusNode,
                obscureText: false,
                style: TextStyle(fontSize: 24, color: Colors.white),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration:    InputDecoration( 
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)),
  counterText: "",
  filled: true,
  focusColor: GREEN_CLR,
  fillColor: GREEN_CLR,
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  counterStyle: TextStyle(height: 0)),
                onChanged: (value) {
                 // nextField(value, pin3FocusNode);

                   if (value.toString().length == 0 && tap2 == 0) {
                     print("Print1");

                          tap2 = 1;
                        }
                        if (value.toString().length > 0) {
                           print("Print2");
                          FocusScope.of(context).requestFocus(pin3FocusNode);
                        }
                        if (value.toString().length == 0 && tap2 == 1) {
                           print("Print3");
                          FocusScope.of(context).requestFocus(pin1FocusNode);
                        }
                  
                }),
          ),
          SizedBox(
          height: 60,
            width: 60,
            child: TextFormField(
              maxLength: 1,
                controller: third,
                focusNode: pin3FocusNode,
                obscureText: false,
                style: TextStyle(fontSize: 24, color: Colors.white),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration:    InputDecoration( 
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)),
  counterText: "",
  filled: true,
  focusColor: GREEN_CLR,
  fillColor: GREEN_CLR,
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  counterStyle: TextStyle(height: 0)),
                onChanged: (value) {
                  //nextField(value, pin4FocusNode);
                   if (value.toString().length == 0 && tap3 == 0) {
                          tap3 = 1;
                        }
                        if (value.toString().length > 0) {
                          FocusScope.of(context).requestFocus(pin4FocusNode);
                        }
                        if (value.toString().length == 0 && tap3 == 1) {
                          FocusScope.of(context).requestFocus(pin2FocusNode);
                        }
                  
                }),
          ),
          Container(
            alignment: Alignment.center,
           height: 60,
            width: 60,
            child: TextFormField(
              maxLength: 1,
              controller: fourth,
              focusNode: pin4FocusNode,
              obscureText: false,
              style: TextStyle(fontSize: 24, color: Colors.white),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration:   InputDecoration( 
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)),
  counterText: "",
  filled: true,
  focusColor: GREEN_CLR,
  fillColor: GREEN_CLR,
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),),
  counterStyle: TextStyle(height: 0)),
              onChanged: (value) {
                // if (value.length == 1) {
                //   pin4FocusNode.unfocus();

                     if (value.toString().length == 0 && tap3 == 0) {
                          tap3 = 1;
                        }
                        if (value.toString().length > 0) {
                          FocusScope.of(context).unfocus();
                        }
                        if (value.toString().length == 0 && tap3 == 1) {
                          FocusScope.of(context).requestFocus(pin3FocusNode);
                        }
                  
              },
            ),
          ),
        ]),
      ),
     
     

                                    SizedBox(
              height: h*0.030,
             ),


             styleText("Didn't receive the verification OTP? ", GRAY_CLR,
                                        FontWeight.normal, 15,),

                                      GestureDetector(onTap: (){}, child: Text("Resend again",style: TextStyle(color: GREEN_CLR,fontSize: 15),)),
   
                                  SizedBox(
                                    height: h*0.030,
                                  ),
   
                                  DefaultButton(text: "Verify", ontap: (){
                                    if(_formkey.currentState!.validate()){
                                    
                                      Navigate_to(context, ChangePassword());
                                    }
                                  }, fontsize: 18, height: h*0.060, width: w*1),
   
   
                                     
                                    
                                  ],
                                )
   
   
                                 
    
       
     ),
   ),
 ),
    );
  }
}






