import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:provider/provider.dart';

import '../Provider/Provider.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _formkey =GlobalKey<FormState>();

  String emailError  = "";
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
      floatingActionButton: Padding(
          padding:  EdgeInsets.only(top: h*0.050,left: w*0.030),
        child: SizedBox(
          height:45,width: 45,
          child: FloatingActionButton(
          
            backgroundColor: FADE_GREEN_CLR,
            onPressed: (){},child: Icon(Icons.arrow_back_ios_new),),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,


 body: Form(
  key: _formkey,
   child: SingleChildScrollView(
     child: Container(
      padding: EdgeInsets.only(top: h*0.17,left: w*0.050,right: w*0.050),
      alignment: Alignment.center,
      height: h*1,
       child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
              SizedBox(
                height: h*0.2,
                width: w*0.5,
                child: SvgPicture.asset('assets/svg_image/OBJECTS(1).svg',)),
    
    
                SizedBox(
                  height: h*0.058,
                ),
    
             styleText("Forgot Password", BLACK_CLR, FontWeight.bold, 19),
    
             Container(
                          
                                    height: h*0.07,
                                    margin: EdgeInsets.only(top: h * 0.040),
                                decoration: BoxDecoration(
                            
                                  color: WHITE70_CLR,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(blurRadius: 14,color: SHADOW_CLR.withOpacity(0.2)),
                                    
                                  ],
                                  
                                ),
                                    child: TextFormField(
                                  
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
   
                                  SizedBox(
                                    height: h*0.040,
                                  ),
   
                                  DefaultButton(text: "Forgot Password", ontap: (){
                                    if(_formkey.currentState!.validate()){
                                      emailError = "";
   
                                    }
                                  }, fontsize: 18, height: h*0.060, width: w*1),
   
   
                                     SizedBox(
                                      height: h*0.040,
                                     ),
                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    styleText("Already have an account?", GRAY_CLR,
                                        FontWeight.normal, 15),
            
                                  
                                          TextButton(
                                              onPressed: () {
                                                ProviderTutorial().NavigateLogin(context);
                                                
                                              },
                                             
                                              child: styleText(
                                                  "Login", GREEN_CLR,
                                                  FontWeight.normal, 15))
            
                                      
                                    
                                  ],
                                )
   
   
                                 
    
       ]),
     ),
   ),
 ),
    );
  }
}