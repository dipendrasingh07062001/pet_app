import 'package:flutter/material.dart';
import 'package:pet_app/Componants/Images&Icons.dart';

import '../../SevicesListAll_Screens/Deworming.dart';
import '../../SevicesListAll_Screens/Medicines.dart';
import '../../SevicesListAll_Screens/Pregnancy.dart';
import '../../SevicesListAll_Screens/Vactionations.dart';
import '../../UTILS/Utils.dart';
import '../CycleTrackingPageViewBuilder/CycleTracking_Page.dart';
import '../Login.dart';
import '../Signup.dart';
import 'package:pet_app/Colors/COLORS.dart';



class DetailModel{
  final String name,ImageUrl;

  DetailModel(this.name, this.ImageUrl, );
}


 class ServicesList extends StatefulWidget {
  const ServicesList({super.key});

  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {



static   List<String> ImageName =[CYCLE_TRACKING,MEDICATIONS,VACCINATIONS,DEWORMING,PREGNANCY];

 static List url = ['assets/png_image/Group 32.png','assets/png_image/Group 32.png','assets/png_image/Group 32.png','assets/png_image/Group 32.png','assets/png_image/Group 32.png'];

   List<Widget> PageRoute =[CycleTrackingPage(),Medicines(),Vaccinations(),Deworming(),Pregnancy()];

      final List<DetailModel> DetailData = List.generate(
        ImageName.length,
            (index)
        => DetailModel('${ImageName[index]}', '${url[index]}'));
  var h;
  var w;
  @override
  Widget build(BuildContext context) {
  h=  MediaQuery.of(context).size.height;
  w= MediaQuery.of(context).size.width;
    return  ListView.builder(
       physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: ImageName.length,
      itemBuilder: (BuildContext context, int index) { 
         return
       SizedBox(
        height: h*0.12,
        width: w*1,
        child: GestureDetector(
          onTap: ()=> Navigate_to(context,  PageRoute[index]),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Card(
              color: WHITE70_CLR,
              elevation: 1,
              // shadowColor: GRAY_CLR,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                
            child:
              Row(children: [
                
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: 
                  
                  Image.asset(DetailData[index].ImageUrl),
                ),
                SizedBox(width: w*0.035,),
                
                
                styleText(DetailData[index].name, DARK_CLR, FontWeight.bold, 17)
                
              ],)
            ),
          ),
        ),
      );
      }
    );

  }
  }
