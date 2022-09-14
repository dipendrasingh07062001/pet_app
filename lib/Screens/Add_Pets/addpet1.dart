import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/Colors/COLORS.dart';

import '../../UTILS/Utils.dart';




class PetsModal{
  final String petName,ImageUrl;

  PetsModal(this.petName, this.ImageUrl, );
}

class AddPets extends StatefulWidget {
  const AddPets({super.key});

  @override
  State<AddPets> createState() => _AddPetsState();
}

class _AddPetsState extends State<AddPets> {


  static List<String> petName = ["Dog","Cat","Rabit","Tutorail"];

  static List url  = ["assets/svg_icon/icon(2).svg","assets/svg_icon/dfd7003b99a2c504402a0b89dc258c99.svg","assets/svg_icon/icon.svg","assets/svg_icon/icon.svg",];

final List<PetsModal> PetDetails = List.generate(petName.length, (index) => PetsModal('${petName[index]}', '${url[index]}'));

     String ChangePet ="Dog";



  var h;
  var w;
  @override
  Widget build(BuildContext context) {

  h = MediaQuery.of(context).size.height;
  w  = MediaQuery.of(context).size.width;

    return  Column(
crossAxisAlignment: CrossAxisAlignment.start,
   children: [

    SizedBox(height: h*0.15,),

      styleText("Select Type", DARK_CLR, FontWeight.bold, 19),
  
     SizedBox(
      
      height: h*0.75,
      //alignment: Alignment.topCenter,
       child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 1
          ),
         itemCount: petName.length,
        scrollDirection: Axis.vertical,                            
           itemBuilder: (BuildContext context, int index) { 
         return GestureDetector(
           onTap: (){
             setState(() {
               ChangePet = petName.elementAt(index);
               print("petName "+ChangePet);
             });
           },
           child: Padding(
             padding: const EdgeInsets.only(left: 5,right: 5),
             child: Card(
               color: petName.elementAt(index)==ChangePet?GREEN_CLR:WHITE_CLR,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SvgPicture.asset(PetDetails[index].ImageUrl,height: h*0.070,color: petName.elementAt(index)==ChangePet?WHITE_CLR:GRAY_CLR,),
                   SizedBox(height: h*0.020,),
         
                   styleText(PetDetails[index].petName, petName.elementAt(index)==ChangePet?WHITE_CLR:GRAY_CLR, FontWeight.normal, 16)
              
                 ],
               )),
           ),
         );

        },
         ),
     ),

       
   ],
    );
    
  }
}