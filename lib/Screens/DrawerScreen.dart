import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
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

                SizedBox(height: h*0.040,),
                 Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     CircleAvatar(backgroundImage: AssetImage("assets/png_image/profile.png"),),
                     SizedBox(
                      width: w*0.020,
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

                 SvgPicture.asset(HOME_ICON),
                  SizedBox(width: 10,),
                    styleText(HOME, WHITE60_CLR, FontWeight.normal, 15),
                ],
               ),

               SizedBox(height: h*0.025,),
                GestureDetector(
                  onTap: ()=>Navigate_to(context, My_Pets()),
                  child: Row(
                  children: [
                
                   SvgPicture.asset(PET_ICON),
                    SizedBox(width: 10,),
                      styleText(MY_PET, WHITE60_CLR, FontWeight.normal, 15),
                  ],
                               ),
                ),
                SizedBox(height: h*0.025,),
                Row(
                children: [

                 SvgPicture.asset(PROFILE_ICON),
                  SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          Navigate_to(context, Profile1());
                        });
                      },
                      child: styleText(PROFILE, WHITE60_CLR, FontWeight.normal, 15)),
                ],
               ),
                SizedBox(height: h*0.025,),
                Row(
                children: [

                 SvgPicture.asset(HEALTH_ICON),
                  SizedBox(width: 10,),
                    styleText(HEALTH_SUPPORT, WHITE60_CLR, FontWeight.normal, 15),
                ],
               ),
                SizedBox(height: h*0.025,),
                Row(
                children: [

                 SvgPicture.asset(DOCT_ICON),
                  SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                        showdialog(context);
                      },
                      child: styleText(UPLOAD_DOCUMENT, WHITE60_CLR, FontWeight.normal, 15)),
                ],
                )
      
              ],
            ),

             Padding(
               padding:  EdgeInsets.only(bottom: h*0.050),
               child: Row(
                  children: [

                   SvgPicture.asset(SETTING_ICON),
                    SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigate_to(context, Setting());
                        },
                        child: styleText(SETTING, WHITE60_CLR, FontWeight.normal, 15)),
                           SizedBox(width: 15,),

                      GestureDetector(
                        onTap: (){
                          // Navigator.of(context).pop();
                          _Logout(context);
                        },
                        child: styleText(LOGOUT, WHITE60_CLR, FontWeight.normal, 15)),

                        styleText(CANCEL, GREEN_CLR, FontWeight.normal, 17)
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
        return Padding(
          padding: const EdgeInsets.all(15),
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Center(
              child: TutorialText(LOGOUT_TITLE, BLACK_CLR, FontWeight.normal, 17),
            ),
            content: Container(
              height: h*0.12,
              width: w*0.24,
              child: Column(
                children: [

                  SizedBox(height: h*0.010,),

                  DefaultButton(text: LOGOUT, ontap: (){}, fontsize: 17, height: 40, width: 180),

                  SizedBox(height: 20,),

                  GestureDetector(
                    onTap: ()=>Navigator.of(context).pop(),
                    child: styleText(CANCEL, GREEN_CLR, FontWeight.normal, 17)),
                 
                      ],
                    ),
                  ),
                
              
            
          ),
        );
      });
}



showdialog(context){
  var h;
var w;

h= MediaQuery.of(context).size.height;
w= MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.only(top: h*0.030),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
              color: WHITE_CLR,
          ),
          width: w*1,
          height: h*0.48,

          child: Column(
            children: [
              

            styleText(UPLOAD_DOCUMENT, DARK_CLR, FontWeight.bold, 17),

         
              Container(
                      alignment: Alignment.centerLeft,
                      height: h*0.055,
                      width: w*0.82,
                      margin: EdgeInsets.only(top: h*0.020),
                      padding: EdgeInsets.only(left: 10),
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

                  SvgPicture.asset(UPLOAD_ICON),

                  SizedBox(height: h*0.015,),
                      GestureDetector(
                  onTap: (){},
                  child: styleText(UPLOAD, GRAY_CLR, FontWeight.normal, 14)),


                  ],)

                ),

                SizedBox(height: h*0.025,),

                DefaultButton(text: SUBMIT, ontap: (){}, fontsize: 17, height: h*0.05, width: w*0.5),

                SizedBox(height: h*0.025,),

                GestureDetector(
                  onTap: ()=>Navigator.of(context).pop(),
                  child: styleText(CANCEL, GREEN_CLR, FontWeight.normal, 17)),
               
                       ],
          ),
                  ),
      
        
        );
      },
    );
  }



// Future _UploadDocuments(BuildContext context) {

//   return showDialog(
    
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           scrollable: true,
//           backgroundColor: WHITE_CLR,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           title: Center(
//             
//           ),
//           content: Container(
//             height: h*0.38,
//             width: w*0.8,
//             child: Column(
//               children: [

     


                
//                 ),
              
            
          
//         );
//       });
// }
