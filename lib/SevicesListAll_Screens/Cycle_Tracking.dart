import 'package:flutter/material.dart';

import '../Colors/COLORS.dart';
import '../UTILS/Utils.dart';

class Cycle_Tracking extends StatefulWidget {
  const Cycle_Tracking({super.key});

  @override
  State<Cycle_Tracking> createState() => _Cycle_TrackingState();
}

class _Cycle_TrackingState extends State<Cycle_Tracking> {
  
    
int _prengnant = 1;
String? _prengnantvalue;



var h;
var w;
  @override
  Widget build(BuildContext context) {
    
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      
       backgroundColor: WHITE70_CLR,
    
   body: Padding(
     padding:  EdgeInsets.all(h*0.020),
     child: Column(children: [

      styleText("Some factors affect your pet’s  \n cycle. are your pet currently?", DARK_CLR, FontWeight.bold, 20),
    DefaultRadioButton(text: "Pregnant", groupValue: _prengnant, value: 1, ontap: (value){
      setState(() {
_prengnant = value!;
_prengnantvalue ="pregnant";

      });
    }
    ),

      DefaultRadioButton(text: "Pregnancy", groupValue: _prengnant, value: 2, ontap: (value){
      setState(() {
_prengnant = value!;
_prengnantvalue ="pregnancy";

      });
    }
    ),

      DefaultRadioButton(text: "Other", groupValue: _prengnant, value: 3, ontap: (value){
      setState(() {
_prengnant = value!;
_prengnantvalue ="other";

      });
    }
    ),

      DefaultRadioButton(text: "None of These", groupValue: _prengnant, value: 4, ontap: (value){
      setState(() {
_prengnant = value!;
_prengnantvalue ="None of these";

      });
    }
    ),

SizedBox(height: h*0.22,),

    DefaultButton(text: "Next", ontap: (){}, fontsize: 16, height: h*0.06, width: w*1),
    SizedBox(height: h*0.010,),

    GestureDetector(onTap: (){
      
    }, child: styleText("Skip", GREEN_CLR, FontWeight.normal, 15))
          ])
          ,
           )


   
    );
  }
}