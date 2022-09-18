import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/Add_Pets/addPet.dart';
import 'package:pet_app/Screens/HOME/ServicesList.dart';
import 'package:pet_app/Screens/Login.dart';
import 'package:pet_app/Screens/Signup.dart';
import 'package:pet_app/Screens/Tutorial.dart';
import 'package:pet_app/UTILS/Utils.dart';

import '../../Componants/Images&Icons.dart';
import '../BlogDetails.dart';
import '../DrawerScreen.dart';
import '../LocationBottomSeet.dart';
import '../Reminder.dart';

class Home extends StatefulWidget {
   Home({super.key,});
   

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _scaffoldKey =  new GlobalKey<ScaffoldState>();

   ScrollController _scrollController = ScrollController();
   TextEditingController searchCantrolller = TextEditingController();
     List service = [
"Health",
"Vets",
"Gromming",
"Trainig","illness"

     ];
     String services ="Health";
  var h;
  var w;
  @override
  Widget build(BuildContext context) {
  h=  MediaQuery.of(context).size.height;
  w= MediaQuery.of(context).size.width;

    
    return Scaffold(
      
      key: _scaffoldKey,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      // backgroundColor: WHITE70_CLR,
        appBar:  AppBar(
        toolbarHeight: h*0.095,
         automaticallyImplyLeading: false,

        leading:

           GestureDetector(
            onTap: () => _scaffoldKey.currentState!.openDrawer(),
    
            child: Image.asset('assets/png_icon/Icon ionic-ios-menu.png',color: GRAY_CLR,)),
          iconTheme: IconThemeData(color: BLACK_CLR),
       backgroundColor: WHITE70_CLR,
       elevation: 0,
        centerTitle: false,
        title: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
        
          children: [
          styleText(LOCATION, GRAY_CLR, FontWeight.normal, 12),
         
          Padding(
            padding:  EdgeInsets.only(left: w*0.1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

    
                Icon(Icons.location_on,color: GREEN_CLR,size: 18,),




                GestureDetector( 
                  onTap: (){
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context, builder: (ctx)=>LocationBottomSeet());
                  },
                  child:
                  styleText("Mansarovar, Jaipur", BLACK70_CLR, FontWeight.bold, 13),)
              ],
            ),
          ),
          ],
        ),


        
        actions: [
           PopupMenuButton<int>(
             offset: Offset(10, 80),
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
              elevation: 10,
              
            icon: Image.asset(USER_IMAGE),
            iconSize: 40,
            padding: EdgeInsets.all(10),
              itemBuilder: (context) => [
                PopupMenuItem( 
                
                  child: Container(
                    child: Column(
                      children: [
                        Row( 
                          children: [
                           Image.asset(USER_IMAGE),
                            SizedBox(
                           
                              width: 10,
                            ),
                           styleText(PET_NAME, BLACK_CLR, FontWeight.normal, 15),
                              
                          ],

                 
                        ),

                        Divider(color: FADE_BLUE_CLR,)
                      ],
                    ),
                  ),
                ),
              PopupMenuItem( 
                
                  child: Container(
                    child: Column(
                      children: [
                        Row( 
                          children: [
                           Image.asset(USER_IMAGE),
                            SizedBox(
                           
                              width: 10,
                            ),
                           styleText(PET_NAME, BLACK_CLR, FontWeight.normal, 15),
                              
                          ],

                 
                        ),

                        Divider(color: FADE_BLUE_CLR,)
                      ],
                    ),
                  ),
                ),

                PopupMenuItem(
                  child: Padding(
                    padding: const EdgeInsets.only(left:15),
                    child: MaterialButton(
                     
                      height: h*0.042,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      color: GREEN_CLR,
                      onPressed: (){
                        Navigate_to(context, AddPetpage());
                      },child: styleText(ADD_PET_NAME, WHITE70_CLR, FontWeight.normal, 13),),
                  ))
               
              ],
             
            ),
       
          ],
        
        
    ),
      drawer: MyDrawer(),

      floatingActionButton: SizedBox(
        height: 70,
        child: FloatingActionButton(onPressed: (){
          Navigate_to(context, Reminder());
        },child: SvgPicture.asset(NOTIFICATION_ICON),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,

      body: Container(
        height: h*1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: HBACKGROUND_CLR
        ),

  
        child: 
        SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(left: w*0.030,right: w*0.030),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: h*0.065,
                                    margin: EdgeInsets.only(top: h * 0.03),
                                decoration: BoxDecoration(
                            
                                  color: WHITE70_CLR,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(blurRadius: 8,color: SHADOW_CLR.withOpacity(0.1)),
                                    
                                  ],
                                  
                                ),
                                    child: TextFormField(
                                      controller: searchCantrolller,
                                      decoration: InputDecoration(
                                        errorText: "",
                                        errorStyle: TextStyle(height: 0),
                                          hintText: "Search",
                                          hintStyle: TextStyle(
                                              color: GRAY_CLR,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal),
                                          prefixIcon: 

                                            Icon(Icons.search,size: 22,color: GRAY_CLR,),
                                          
          
                                          suffixIcon:Image.asset(FILTTER_ICON) ,
                                          border: InputBorder.none)),
                                  
                                    ),
                                     
                                     SizedBox(height: h*0.020,),
                                    
                                    styleText(SERVICES, BLACK_CLR, FontWeight.bold, 19),
          
          
                                    SizedBox(
                                      height: h*0.010,
                                    ),
          
          
                                    SizedBox(height: h*0.145,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        controller: _scrollController,
                                        itemCount: service.length,
                                        scrollDirection: Axis.horizontal,
                                        // physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (BuildContext context, int index) {  
                                          return
                                         Column(
                                          children: [
                                            GestureDetector(onTap: (){
                                              setState(() {
                                               services= service.elementAt(index);
                                               print("services"+ services);
                                              });
                                            },

                                              child: Container(
                                                margin: EdgeInsets.symmetric(horizontal: 5),
                                                height: 70,
                                                width: 70,
                                                alignment: Alignment.center,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                                              color: 
                                                                                      service.elementAt(index)==services?GREEN_CLR:
                                              WHITE70_CLR,
                                              boxShadow: [BoxShadow(color: SHADOW_CLR)]
                                              ),
                                              child: Image.asset(SERVICES_ICON,color: service.elementAt(index)==services? WHITE70_CLR:GRAY_CLR,),
                                              ),
                                            ),
                                      
                                            SizedBox(height: h*0.010,),
                                      
                                      
                                            styleText(service.elementAt(index), GRAY_CLR, FontWeight.bold, 13)
                                          ],
                                        );
                                        }
                                      ),
                                    ),
          
                                     SizedBox(
                                      height:  services=="Health"?h*0.6:h*0.050,
                                      child:services =="Health" ?ServicesList():Center(child: CircularProgressIndicator())),
        
        
        
        
        

                                    
                                    styleText(EXPLORE, BLACK_CLR, FontWeight.bold, 19),
        
                                        SizedBox(
                                          height: h*0.015,
                                        ),
                                  
                                     SizedBox(
                                      height: h*0.25,
                                       child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 3,
                                         itemBuilder: (BuildContext context, int index) {  
                                        return GestureDetector(
                                          onTap: (() => Navigate_to(context, Blog_Details())),
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
                                       ),
                                     ),
        
        
        
        
        
        
              
            ],),
          ),
        ),
      ),
    );
  }
}






