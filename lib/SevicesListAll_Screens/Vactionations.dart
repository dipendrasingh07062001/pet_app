import 'package:flutter/material.dart';

import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/Screens/HOME/ServicesList.dart';
import 'package:pet_app/SevicesListAll_Screens/Add_Vaccinations.dart';
import 'package:pet_app/UTILS/Utils.dart';

class Vaccinations extends StatefulWidget {
  const Vaccinations({super.key});

  @override
  State<Vaccinations> createState() => _VaccinationsState();
}

class _VaccinationsState extends State<Vaccinations> {

  var h;
  var w;
  @override
  Widget build(BuildContext context) {

  h = MediaQuery.of(context).size.height;
  w  = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar(VACCINATOIN),

       floatingActionButton: FloatingActionButton(
        backgroundColor: WHITE70_CLR,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)),side: BorderSide(color: GREEN_CLR)),
        onPressed: (){
          Navigate_to(context, Add_Vaccinations());
        },child: Icon(Icons.add,size: 40,color: GREEN_CLR,),heroTag: "b1",),

      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 5,
        padding: EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (BuildContext context, int index) {  
        return Padding(
              padding:  EdgeInsets.only(left: w*0.030,right: w*0.030,bottom: h*0.020),
          child: Container(
          
            width: w*1,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color:Colors.white,
            boxShadow: [
              BoxShadow(color: DROP_CLR.withOpacity(0.1),blurRadius: 16)
            ]),
            child: Padding(
              padding:  EdgeInsets.only(left: w*0.030,right: w*0.030,top: h*0.010,bottom: h*0.005),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                styleText(CANINE, BLACK_CLR, FontWeight.bold, 16),
      
                SizedBox(height: h*0.005,),
      
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
      
                        SizedBox(
                          width: w*0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText(LAST_VACCINATION, GRAY_CLR, FontWeight.normal, 13),
                               styleText("Date : 20-12-2022", BLACK_CLR, FontWeight.normal, 15),
                            ],
                          ),
                        ),
                       

                         SizedBox(
                          width: w*0.4,
                           child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText(NEXT_VACCINATION, GRAY_CLR, FontWeight.normal, 13),
                               styleText("Date : 20-12-2022", BLACK_CLR, FontWeight.normal, 15),
                            ],
                        ),
                         )
                    ],),
      
      
      
                   SizedBox(height: h*0.005,),
      
                   Row(
                    
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                       
                       Container(
                        child: Image.asset(CERTIFICATE_IMAGE,height: 60,)),
   
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
              
                 SizedBox(
                  height: h*0.040,
                   child: GestureDetector(
                    child: CircleAvatar(backgroundColor: FADE_BLUE_CLR,child: Icon(Icons.edit,color: WHITE70_CLR,),),),
                 ),

SizedBox(width: w*0.010,),

            SizedBox(
              height: h*0.040,
              child: GestureDetector(
          child: CircleAvatar(backgroundColor: FADE_BLUE_CLR,child: Icon(Icons.delete,color: WHITE70_CLR,size: 20,),),
          
        ),
            ),

                     
                          ],
                  ),

                    ],),

              ]      
            ),
          ),
          )
        );
        }
      ),
    );
  }
}