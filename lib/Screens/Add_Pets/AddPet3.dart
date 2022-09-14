import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../Colors/COLORS.dart';
import '../../Componants/Images&Icons.dart';
import '../../UTILS/Utils.dart';

int index = 0;
class Addpet3 extends StatefulWidget {
  const Addpet3({super.key});

  @override
  State<Addpet3> createState() => _Addpet3State();
}

class _Addpet3State extends State<Addpet3> {



  var h;
  var w;
  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w =MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


SizedBox(height: h*0.15,),
        Padding(
          padding:  EdgeInsets.only(left: w*0.040),
          child: styleText("Upload Pictures", DARK_CLR, FontWeight.bold, 19),
        ),
      
  Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      GestureDetector(
        onTap: (){
          setState(() {
            index = 0;
            _opengallery(context);
          });
        },
        child: Container(
                        alignment: Alignment.center,
                        height: h*0.16,
                        width: w*0.4,
                    margin: EdgeInsets.only(top: h*0.020),
                        decoration: BoxDecoration(
                          color: WHITE70_CLR ,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: TFFBORDER_CLR)
                        ),
      
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
      
                        SvgPicture.asset("assets/svg_icon/Icon feather-image.svg"),
      
                        SizedBox(height: h*0.015,),
                            GestureDetector(
                        onTap: (){},
                        child: styleText("Open Gallary", GRAY_CLR, FontWeight.normal, 14)),
      
      
                        ],)
      
                      ),
      ),



 GestureDetector(
        onTap: (){
          setState(() {
            index = 0;
            _opencamera(context);
          });
        },
        child:
                      Container(
                      alignment: Alignment.center,
                      height: h*0.16,
                      width: w*0.4,
                      margin: EdgeInsets.only(top: h*0.020),
                      decoration: BoxDecoration(
                        color: WHITE70_CLR ,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: TFFBORDER_CLR)
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                      SvgPicture.asset("assets/svg_icon/Icon feather-camera.svg"),

                      SizedBox(height: h*0.015,),
                          GestureDetector(
                      onTap: (){},
                      child: styleText("Open Camera", GRAY_CLR, FontWeight.normal, 14)),


                      ],)

                    ),
 )
    ],
  ),



  // SelectImage==null?

Align(
  alignment: Alignment.bottomCenter,
  child:   SizedBox(
  
   
  
    height: h*0.16,
  
    child:   ListView.builder(
  
    
  
      itemCount: 3,
  
     
  
    
  
      scrollDirection: Axis.horizontal,
  
    
  
      itemBuilder: (BuildContext context, int index) {  
  
    
  
     return   Container(

      alignment: Alignment.center,
  
        margin: EdgeInsets.only(top: h*0.040,left: 10,right: 5),
  
        height: h*0.8,

        width: w*0.26,
  
        decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),
  
          border: Border.all(color: GRAY_CLR.withOpacity(0.5)),
  
         color: FADE_BLUE_CLR.withOpacity(0.3),),
  
    
  
      
  
    
  
       
  
    
  
      
  
    
  
        child:  
  
    
  
      
  
    
  
        
  
    
  
      
  
    
  
         Padding(
  
    
  
      
  
    
  
           padding: const EdgeInsets.all(8.0),
  
    
  
      
  
    
  
           child: ClipRRect(
  
    
  
      
  
    
  
            borderRadius: BorderRadius.circular(20),
  
    
  
      
  
    
  
            clipBehavior: Clip.antiAlias,
  
    
  
      
  
    
  
        
  
    
  
      
  
    
  
            child: Stack(
  
    
  
      
  
    
  
      
  
    
  
      
  
    
  
              children: [
  
    
  
      
  
    
  
                SizedBox(
  
    
  
      
  
    
  
                  
  
    
  
      
  
    
  
                  child:
  
    
  
      
  
    
  
                  SelectImage ==null? Image.asset(DOG_IMAGE,fit: BoxFit.fill,):  Image.file(File(SelectImage!.path,), fit: BoxFit.fill,height: h*0.12,width: w*1,),
  
    
  
      
  
    
  
        ),
  
    
  
      
  
    
  
      
  
    
  
      
  
    
  
                  Align(
  
    
  
      
  
    
  
                  alignment: Alignment.topRight,
  
    
  
      
  
    
  
                  child: SizedBox(
  
    
  
      
  
    
  
                    height: h*0.040,
  
    
  
      
  
    
  
                    child: CircleAvatar(backgroundColor: WHITE_CLR,
  
    
  
      
  
    
  
                      child: GestureDetector(
  
    
  
      
  
    
  
                        
  
    
  
      
  
    
  
                        child: Icon(
  
    
  
      
  
    
  
                          Icons.delete,size: 18,color: FADE_GREEN_CLR,),
  
    
  
      
  
    
  
                      )),
  
    
  
      
  
    
  
                  ),
  
    
  
      
  
    
  
                )
  
    
  
      
  
    
  
      
  
    
  
      
  
    
  
              
  
    
  
      
  
    
  
              ],
  
    
  
      
  
    
  
            )),
  
    
  
      
  
    
  
         ) 
  
    
  
      
  
    
  
      
  
    
  
      
  
    
  
      );
  
    
  
      }
  
    
  
    ),
  
  ),
)


// :Container()



    ],);
  }




 PickedFile? SelectImage=null;
  void _opengallery(BuildContext context) async{
    final coverImage = await ImagePicker().getImage(
      source: ImageSource.gallery ,
    );
    setState(() {
      SelectImage = coverImage!;
      
    });

  
  }



  void _opencamera(BuildContext context)  async{
    final CoverImage_Via_Camera = await ImagePicker().getImage(
      source: ImageSource.camera ,
    );
    setState(() {
      SelectImage = CoverImage_Via_Camera!;
      
    });
  
  }
}

