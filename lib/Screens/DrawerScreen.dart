import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/UTILS/Utils.dart';

import 'My_Pets/My_Pets.dart';
import 'Profile.dart';
import 'Setting.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
      backgroundColor: GREEN_CLR,
      child: DrawerHeader(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            
            Column(
              children: [
      
                Align(
                  alignment: Alignment.topRight,
                  child: BackButton(
                    color: WHITE70_CLR,
                    onPressed: ()=>Navigator.of(context).pop(),),
                ),
                 Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     CircleAvatar(backgroundImage: AssetImage("assets/png_image/profile.png"),),
                     SizedBox(
                      width: w*0.010,
                     ),
      
                     RichText(
                          text: TextSpan(
                           text: "Michael Jordan \n",
                            style:TextStyle(
                              color: WHITE60_CLR,
                              fontSize: 17
                            ),
                            children: [
                              TextSpan(
                                text:"Bhimsingh123@gamil.com",style: TextStyle(fontSize: 15)
                              )
                            ]
                          ),
                        ),
                   ],
                 ),
       SizedBox(height: h*0.06,),
      
            Row(
                children: [

                 SvgPicture.asset("assets/svg_icon/Icon feather-home.svg"),
                  SizedBox(width: 10,),
                    styleText("Home", WHITE60_CLR, FontWeight.normal, 15),
                ],
               ),

               SizedBox(height: h*0.025,),
                GestureDetector(
                  onTap: ()=>Navigate_to(context, My_Pets()),
                  child: Row(
                  children: [
                
                   SvgPicture.asset("assets/svg_icon/icon.svg"),
                    SizedBox(width: 10,),
                      styleText("My Pets", WHITE60_CLR, FontWeight.normal, 15),
                  ],
                               ),
                ),
                SizedBox(height: h*0.025,),
                Row(
                children: [

                 SvgPicture.asset("assets/svg_icon/Icon feather-user.svg"),
                  SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          Navigate_to(context, Profile1());
                        });
                      },
                      child: styleText("Profile", WHITE60_CLR, FontWeight.normal, 15)),
                ],
               ),
                SizedBox(height: h*0.025,),
                Row(
                children: [

                 SvgPicture.asset("assets/svg_icon/Icon feather-help-circle.svg"),
                  SizedBox(width: 10,),
                    styleText("Health & Support", WHITE60_CLR, FontWeight.normal, 15),
                ],
               ),
                SizedBox(height: h*0.025,),
                Row(
                children: [

                 SvgPicture.asset("assets/svg_icon/Icon feather-file-minus.svg"),
                  SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                        _UploadDocuments(context);
                      },
                      child: styleText("Upload Document", WHITE60_CLR, FontWeight.normal, 15)),
                ],
                )
      
              ],
            ),

             Padding(
               padding:  EdgeInsets.only(bottom: h*0.050),
               child: Row(
                  children: [

                   SvgPicture.asset("assets/svg_icon/Icon feather-settings(1).svg"),
                    SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigate_to(context, Setting());
                        },
                        child: styleText("Settings   |  ", WHITE60_CLR, FontWeight.normal, 15)),
                           SizedBox(width: 15,),

                      GestureDetector(
                        onTap: (){
                          // Navigator.of(context).pop();
                          _Logout(context);
                        },
                        child: styleText("Logout", WHITE60_CLR, FontWeight.normal, 15)),

                        styleText("Cancel", GREEN_CLR, FontWeight.normal, 17)
                  ],
                 ),
             )
          ],
        ),
      ),
    );
  }
}







Future<void> _Logout(BuildContext context) {
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
            child: styleText("Are you sure you want to Logout?", BLACK_CLR, FontWeight.normal, 17),
          ),
          content: Container(
            height: h*0.15,
            width: w*0.32,
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







Future _UploadDocuments(BuildContext context) {
var h;
var w;

h= MediaQuery.of(context).size.height;
w= MediaQuery.of(context).size.width;
  return showDialog(
    
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          backgroundColor: WHITE_CLR,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Center(
            child: styleText("Upload Document", BLACK_CLR, FontWeight.normal, 17),
          ),
          content: Container(
            height: h*0.38,
            width: w*0.8,
            child: Column(
              children: [

     


                Container(
                  alignment: Alignment.centerLeft,
                  height: h*0.055,
                  width: w*0.82,
                  padding: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: TFFBORDER_CLR)
                  ),

                  child: TextFormField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Document Name",
                      hintStyle: TextStyle(fontSize: 14)
                    ),
                  ),

                ),


                  Container(
                  alignment: Alignment.center,
                  height: h*0.15,
                  width: w*0.82,
                  margin: EdgeInsets.only(top: h*0.020),
                  decoration: BoxDecoration(
                    color: WHITE70_CLR ,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: TFFBORDER_CLR)
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                  SvgPicture.asset("assets/svg_icon/Icon feather-upload-cloud.svg"),

                  SizedBox(height: h*0.015,),
                      GestureDetector(
                  onTap: (){},
                  child: styleText("Upload", GRAY_CLR, FontWeight.normal, 14)),


                  ],)

                ),

                SizedBox(height: h*0.025,),

                DefaultButton(text: "Submit", ontap: (){}, fontsize: 17, height: 38, width: w*0.45),

                SizedBox(height: h*0.025,),

                GestureDetector(
                  onTap: ()=>Navigator.of(context).pop(),
                  child: styleText("Cancel", GREEN_CLR, FontWeight.normal, 17)),
               
                    ],
                  ),
                ),
              
            
          
        );
      });
}
