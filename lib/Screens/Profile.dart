import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Colors/COLORS.dart';
import '../UTILS/Utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile1 extends StatefulWidget {
  const Profile1({Key? key}) : super(key: key);

  @override
  State<Profile1> createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  var h;
  var w;

  File? pickedImage;

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);

      if (photo == null) return;

      final tempImage = File(photo.path);

      setState(() {
        pickedImage = tempImage;
      });

   
    } catch (error) {
      debugPrint(error.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: AppBar(
        toolbarHeight: h*0.08,
        centerTitle: true,
        backgroundColor: WHITE70_CLR,
        elevation: 1,
        title: styleText( "Profile", DARK_CLR, FontWeight.bold, 17),
      ),
 body: Padding(
   padding:  EdgeInsets.only(left: w*0.05,right: w*0.05),
   child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [


       Padding(
         padding:  EdgeInsets.only(top: h*0.05),
         child: Align(
            alignment: Alignment.center,
           child: Stack(
             children: [
               Container(
                 decoration: BoxDecoration(
                   // border: Border.all(color: Colors.indigo, width: 5),
                     borderRadius: const BorderRadius.all(
                       Radius.circular(100),
                     ),
                     color: WHITE_CLR
                 ),
                 child: ClipOval(
                   child:
                   // display Image
                   ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                     child: pickedImage != null
                         ? Image.file(
                       pickedImage!,
                       width: 130,
                       height: 130,
                     )
                         :
                     // display Image
                     Image.asset(
                       'assets/png_image/user.png',
                       width: 130,
                       height: 130,
                       fit: BoxFit.fill,
                     ),
                   ),
                 ),
               ),


                Positioned(
                 bottom: 0,
                 right: 10,
                 child: Container(
                  height: 35,width: 35,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(50),
                       color: GREEN_CLR

                   ),
                   child:
                   GestureDetector(
                       onTap: (){
                         pickImage(ImageSource.camera);
                       },child: Icon(Icons.camera_alt_sharp,color: WHITE70_CLR,size: 20,)),
               )
                )
              
             ],
           ),
         ),
       ),
       Padding(
         padding:  EdgeInsets.only(top: h*0.03),
         child: styleText("Full Name", BLACK_CLR, FontWeight.normal, 15),
       ),
       Container(
        padding: EdgeInsets.only(left: 10),
         margin: EdgeInsets.only(top: h*0.015),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           color: WHITE_CLR,
           boxShadow: [BoxShadow(color: GRAY_CLR,blurRadius: 1)]
         ),
         child: TextFormField(
          
           decoration: InputDecoration(
            hintText: "Name",
             border: InputBorder.none
           ),
         ),
       ) ,
       Padding(
         padding:  EdgeInsets.only(top: h*0.02),
         child: styleText("Email Address", BLACK_CLR, FontWeight.normal, 15),
       ),
       Container(
         margin: EdgeInsets.only(top: h*0.010),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           color: WHITE_CLR,
           boxShadow: [BoxShadow(color: GRAY_CLR,blurRadius: 1)]
         ),
         child: TextFormField(
           decoration: InputDecoration(
             hintText: "  dummy123@gmail.com",
             border: InputBorder.none
           ),
         ),
       ),
       Padding(
         padding:  EdgeInsets.only(top: h*0.02),
         child: styleText("Phone Number", BLACK_CLR, FontWeight.normal, 15),
       ),
       Container(
        padding: EdgeInsets.only(left: 10),
         margin: EdgeInsets.only(top: h*0.01),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           color: WHITE_CLR,
           boxShadow: [BoxShadow(color: GRAY_CLR,blurRadius: 1)]
         ),
         child: TextFormField(
           decoration: InputDecoration(
            hintText: "2314655",
             border: InputBorder.none
           ),
         ),
       ),


SizedBox(height: h*0.070,),
Align(
  alignment: Alignment.center,
  child: DefaultButton(text: "Update Profile", ontap: (){}, fontsize: 16, height: h*0.060, width: w*0.8))


     ],
   ),
 ),
    );

  }
}