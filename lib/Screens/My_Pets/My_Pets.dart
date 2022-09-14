import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/HOME/ServicesList.dart';
import 'package:pet_app/UTILS/Utils.dart';

import '../Add_Pets/addPet1.dart';

class My_Pets extends StatefulWidget {
  const My_Pets({super.key});

  @override
  State<My_Pets> createState() => _My_PetsState();
}

class _My_PetsState extends State<My_Pets> {

  var h;
  var w;
  @override
  Widget build(BuildContext context) {

  h = MediaQuery.of(context).size.height;
  w  = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: AppBar(centerTitle: true,
      backgroundColor: WHITE70_CLR,
      elevation: 1,
      title: styleText( "My Pets", DARK_CLR, FontWeight.bold, 17), 
      ),


       floatingActionButton: FloatingActionButton(
        backgroundColor: WHITE70_CLR,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)),side: BorderSide(color: GREEN_CLR)),
        onPressed: (){},child: Icon(Icons.add,size: 40,color: GREEN_CLR,),heroTag: "b1",),

      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {  
        return
        
        
        
        
         Stack(
           children: [
             
             Padding(
                  padding:  EdgeInsets.only(left: w*0.32,right: w*0.030,top: h*0.050,bottom: h*0.020),
              child: Container(
                // height: h*0.45,
                padding: EdgeInsets.only(left: w*0.020),
                width: w*0.6,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color:Colors.white,
                boxShadow: [
                  BoxShadow(color: DROP_CLR.withOpacity(0.2),blurRadius: 10)
                ]),
                child: Padding(
                  padding:  EdgeInsets.only(left: w*0.028,right: w*0.030,top: h*0.010,bottom: h*0.010),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                       styleText("Charlie Pet", BLACK_CLR, FontWeight.bold, 16),
                        styleText("Brussels Griffon", GRAY_CLR, FontWeight.normal, 13),
                       styleText("Male", GRAY_CLR, FontWeight.normal, 13),
      
                       Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
      
                        styleText("21 Kg", BLACK_CLR, FontWeight.normal, 15),
                         
                        Row(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        
                  
                     SizedBox(
                      height: h*0.040,
                       child: GestureDetector(
                        onTap: ()=>Navigate_to(context, AddPets()),
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
                  )
              ),
              )
        ),

        SvgPicture.asset("assets/svg_image/Group 326.svg"),
           ],
         );
        }
      ),
    );
  }
}