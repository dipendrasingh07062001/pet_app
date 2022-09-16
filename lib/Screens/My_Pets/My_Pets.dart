import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/HOME/ServicesList.dart';
import 'package:pet_app/UTILS/Utils.dart';

import '../../Componants/Images&Icons.dart';
import '../Add_Pets/addPet.dart';
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
      appBar: DefaultAppBar(MY_PET),


       floatingActionButton: FloatingActionButton(
        backgroundColor: WHITE70_CLR,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)),side: BorderSide(color: GREEN_CLR)),
        onPressed: (){
          Navigate_to(context, AddPetpage());
        },child: Icon(Icons.add,size: 40,color: GREEN_CLR,),heroTag: "b1",),

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
                      height: h*0.042,
                       child: GestureDetector(
                        onTap: ()=>Navigate_to(context, AddPetpage()),
                        child: CircleAvatar(backgroundColor: FADE_BLUE_CLR,child: Icon(Icons.edit,color: WHITE70_CLR,size: 18,),),),
                     ),

                SizedBox(width: w*0.005,),

                SizedBox(
                  height: h*0.042,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        _Delete(context);
                      });
                    },
              child: CircleAvatar(backgroundColor: FADE_BLUE_CLR,child: Icon(Icons.delete,color: WHITE70_CLR,size: 18,),),
              
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

        SvgPicture.asset(MY_PET_IMAGE),
           ],
         );
        }
      ),
    );
  }
}





Future<void> _Delete(BuildContext context) {
var h;
var w;

h= MediaQuery.of(context).size.height;
w= MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Center(
            child: TutorialText(DELETE_PET, BLACK_CLR, FontWeight.normal, 17),
          ),
          content: Container(
            height: h*0.12,
            width: w*0.32,
            child: Column(
              children: [

                SizedBox(height: h*0.010,),

                DefaultButton(text: DELETE, ontap: (){
                  Navigator.of(context).pop();
                }, fontsize: 17, height: 40, width: 150),

                SizedBox(height: 20,),

                GestureDetector(
                  onTap: ()=>Navigator.of(context).pop(),
                  child: styleText(CANCEL, GREEN_CLR, FontWeight.normal, 17)),
               
                    ],
                  ),
                ),
              
            
          
        );
      });
}
