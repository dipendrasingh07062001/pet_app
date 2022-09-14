import 'package:flutter/material.dart';

import '../UTILS/Utils.dart';
import 'package:pet_app/Colors/COLORS.dart';




Future<void> _UploadDocuments(BuildContext context) {
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
            child: styleText("Upload Document", BLACK_CLR, FontWeight.normal, 17),
          ),
          content: Container(
            height: h*0.25,
            width: w*0.4,
            child: Column(
              children: [

                SizedBox(height: h*0.010,),

                DefaultButton(text: "Logout", ontap: (){}, fontsize: 17, height: 40, width: 150),

                SizedBox(height: 20,),

                GestureDetector(
                  onTap: ()=>Navigator.of(context).pop(),
                  child: styleText("Cancel", GREEN_CLR, FontWeight.normal, 17)),
               
                    ],
                  ),
                ),
              
            
          
        );
      });
}
