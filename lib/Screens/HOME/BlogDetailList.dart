import 'package:flutter/material.dart';
import 'package:pet_app/Provider/ServiceListProvider.dart';
import 'package:provider/provider.dart';

import '../../Colors/COLORS.dart';
import '../../Componants/Images&Icons.dart';
import '../../UTILS/Utils.dart';
import '../BlogDetails.dart';

class BlogDetailsList extends StatelessWidget {
   BlogDetailsList({super.key});

 var h;
  var w;
  @override
  Widget build(BuildContext context) {
  h=  MediaQuery.of(context).size.height;
  w= MediaQuery.of(context).size.width;

    
    return  Consumer<BlogDetailProvider>(
      builder: (BuildContext context, value, Widget? child) {  
      return ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 2,
                                           itemBuilder: (BuildContext context, int index) {  
                                          return GestureDetector(
                                            onTap: ()=>value.OnClicked(context),
                                            child: Container(
                                                 
                                                          padding: EdgeInsets.all(8),                    
                                                 height: h*0.25,
                                                 alignment: Alignment.bottomCenter,
                                                                              
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                // color: Colors.red,
                                                image: DecorationImage(image: AssetImage(DOUNLOAD_ICON,),fit: BoxFit.cover)
                                              ),
                                             
                                              child: Padding(
                                                padding: const EdgeInsets.only(bottom: 8),
                                                child: SizedBox(
                                                  height: h*0.095,width:w*0.42,
                                                  child: Card(
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 5),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                                                     
                                                        SizedBox(
                                                          height: h*0.005,
                                                        ),
                                                          RichText(textScaleFactor: 1,
                                                                                          
                                                        text: TextSpan(
                                                                                       children: <InlineSpan>[
                                                                                      TextSpan(text: 'Heatlth ', style: TextStyle(color: GRAY_CLR,fontSize: 10,)),
                                                                                     
                                                        WidgetSpan(
                                                   alignment: PlaceholderAlignment.top,
                                                   baseline: TextBaseline.alphabetic,
                                                   child: SizedBox(width: w*0.1,)),
                                                  TextSpan(text: '18 August 2022 ',style: TextStyle(color: GRAY_CLR,fontSize: 10) ),
                                                                                      
                                                      ],
                                                                                      
                                                      ),
                                                          ),
                                                                                     
                                                          SizedBox(height: h*0.005,),
                                                
                                                                                     
                                                          styleText("Lorem Ipsum is simply dummy text of....", DARK_CLR, FontWeight.bold, 12,)
                                                      ]),
                                                    ),
                                                  ),
                                                ),
                                              ) ,
                                                                                 
                                             ),
                                          );
                                           }
                                         );
      }
    );
  }
}