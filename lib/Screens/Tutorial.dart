import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/Screens/GetStart.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:pet_app/main.dart';







class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {

  bool isClick = false;

  

  int currentIndex = 0;

  var  h;
  var w;



  @override
  Widget build(BuildContext context) {

    h= MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
       
       body: Container(
         alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          "assets/png_image/Group 24@2x.png",
        ),
        fit: BoxFit.cover,
          ),
        ),
          
         child: Column(
         children: [
                  SizedBox(
                    height: h*0.080,
                  ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextButton(onPressed: (){}, child: Text("Skip>>",style: TextStyle(color: NON_DARK_CLR),)),
                  )),

                  SizedBox(
                    height: h*0.060,
                  ),
            
              Image.asset(
                    DOG_IMAGE,
                    height: h * 0.27,
                  ),

                  SizedBox(
                    height: h*0.020,
                  )
                  ,


             isClick==false? TutorialText(TITLE, DARK_CLR, FontWeight.bold, 25):TutorialText(TITLE, DARK_CLR, FontWeight.bold, 25),
                  SizedBox(
                    height: h*0.010,
                  ),

            isClick==false? TutorialText(TUTORIAL_SUB_TITLE, DARK_CLR, FontWeight.normal, 18):
                            TutorialText(TUTORIAL_SUB_TITLE, DARK_CLR, FontWeight.normal, 18),





           SizedBox(
            height: h*0.090,
           ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    Padding(
                      padding:  EdgeInsets.only(left: w*0.050),
                      child: Row(
                        children: [

                          
                          Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: GREEN_CLR),
                              color: isClick==false? GREEN_CLR:WHITE_CLR
                            ),
                          ),

                          SizedBox(
                            width: w*0.020,
                          ),

                           Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: GREEN_CLR),
                              color: isClick==true?GREEN_CLR:WHITE_CLR
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isClick=true;
                          currentIndex++;
                          print(currentIndex);
                      
                         if(currentIndex>=2){
                          Navigate_to(context, GetStarted());
                          }
                         
                          
                            
                        });
                      
                           
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: h * 0.07,
                          width: w * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
                            color: GREEN_CLR
                          ),
                          child: styleText( isClick==false?NEXT:GET_STARTED
                          , WHITE70_CLR, FontWeight.normal, 18)),
                    ),
                  ],
                )
              
              

         ]),
       ),

    );
  }
}