import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/UTILS/Utils.dart';

class Blog_Details extends StatefulWidget {
  const Blog_Details({super.key});

  @override
  State<Blog_Details> createState() => _Blog_DetailsState();
}

class _Blog_DetailsState extends State<Blog_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar("Blog Details"),



body: SingleChildScrollView(
  child:   Column(
  
    crossAxisAlignment: CrossAxisAlignment.start,
  
    children: [
  
  
  SizedBox(height: 10,),
    Image.asset("assets/png_image/company-pic-3.png"),
  
  
  
  
  
    Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      textAlign: TextAlign.start,
      style:TextStyle(color: BLACK_CLR,fontSize: 16) ),
    ),
  
    SizedBox(height: 5,),
  
     
  
     Padding(
  padding: const EdgeInsets.only(left: 15,right: 15),
         child: styleText("Health . 12 August 2022", GRAY_CLR, FontWeight.normal, 14),
     ),
  
  
  
     SizedBox(height: 10,),
  
  
  
      Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
        child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        style:TextStyle(color: GREEN_CLR,fontSize: 15)),
      )
  
  
  
  ]),
),
    );
  }
}