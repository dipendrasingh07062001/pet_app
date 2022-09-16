import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/HOME/ServicesList.dart';
import 'package:pet_app/SevicesListAll_Screens/Add_Pregnancy.dart';
import 'package:pet_app/UTILS/Utils.dart';

class Pregnancy extends StatefulWidget {
  const Pregnancy({super.key});

  @override
  State<Pregnancy> createState() => _PregnancyState();
}

class _PregnancyState extends State<Pregnancy> {

  var h;
  var w;
  @override
  Widget build(BuildContext context) {

  h = MediaQuery.of(context).size.height;
  w  = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar("Pregnancy"),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 2,
        padding: EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (BuildContext context, int index) {  
        return Padding(
              padding:  EdgeInsets.only(left: w*0.030,right: w*0.030,bottom: h*0.020),
          child: Container(
            // height: h*0.45,
            width: w*1,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color:Colors.white,
            boxShadow: [
              BoxShadow(color: DROP_CLR.withOpacity(0.1),blurRadius: 16)
            ]),
            child: Padding(
              padding:  EdgeInsets.only(left: w*0.030,right: w*0.030,top: h*0.015,bottom: h*0.010),
              child: Column(children: [
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                  styleText("Pregnancy", BLACK_CLR, FontWeight.bold, 16),



      
                  SizedBox(
                   height: h*0.040,
                    child: GestureDetector(
                      onTap: (){
                        Navigate_to(context, Add_Pregnancy());
                      },
                     child: CircleAvatar(backgroundColor: FADE_BLUE_CLR,child: Icon(Icons.edit,color: WHITE70_CLR,size: 20,),),),
                  ),


                ],),
      
                SizedBox(height: h*0.010,),
      
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
      
                        SizedBox(
                          width: w*0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText("Sexually Active", GRAY_CLR, FontWeight.normal, 13),
                               styleText("Yes", BLACK_CLR, FontWeight.normal, 15),

                               SizedBox(height: h*0.015,),
                                styleText("Health of Previous littter", GRAY_CLR, FontWeight.normal, 13),
                               styleText("Good", BLACK_CLR, FontWeight.normal, 15),
                            ],
                          ),
                        ),
                       

                         SizedBox(
                          width: w*0.4,
                           child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText("No. of Past Pregnancy", GRAY_CLR, FontWeight.normal, 13),
                               styleText("2", BLACK_CLR, FontWeight.normal, 15),

                                  SizedBox(height: h*0.015,),
                                styleText("Neutered", GRAY_CLR, FontWeight.normal, 13),
                               styleText("Yes", BLACK_CLR, FontWeight.normal, 15),
                            ],
                        ),
                         )
                    ],),
      
                   SizedBox(height: h*0.010,),
      
      
                   Divider(thickness: 2,color: GRAY_CLR.withOpacity(0.1),),
                     
                   Row(children: [
                 
                 styleText("Reminder", DARK_CLR, FontWeight.bold, 14), 
                 SizedBox(width: w*0.010,),
                 MaterialButton(
                  height: h*0.028,minWidth: w*0.16,
                  color: GREEN_CLR,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  onPressed: (){},child:
                  styleText("6 Months",WHITE_CLR,FontWeight.normal,11)
                )
                   ],),
      
      
                   SizedBox(height: h*0.010,),
      
                   


Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
      
                        SizedBox(
                          width: w*0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText("Reminder Date", GRAY_CLR, FontWeight.normal, 13),
                               styleText("21st", BLACK_CLR, FontWeight.normal, 15),
                            ],
                          ),
                        ),
                       

                         SizedBox(
                          width: w*0.4,
                           child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText("Reminder time", GRAY_CLR, FontWeight.normal, 13),
                               styleText("08:00 AM", BLACK_CLR, FontWeight.normal, 15),
                            ],
                        ),
                         )
                    ],),
      

                    ]),
            ),
          ),
        );
        }
      ),
    );
  }
}