import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Provider/Provider.dart';
import 'package:pet_app/Provider/ServiceListProvider.dart';
import 'package:pet_app/Screens/Add_Pets/addPet.dart';
import 'package:pet_app/Screens/HOME/BlogDetailList.dart';
import 'package:pet_app/Screens/HOME/ServicesList.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:provider/provider.dart';
import '../../Componants/Images&Icons.dart';
import '../DrawerScreen.dart';
import '../LocationBottomSeet.dart';
import '../Reminder.dart';
import 'ServiceHealthList.dart';

 String? Search;

class Home extends StatefulWidget {
   Home({super.key,});
   

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _scaffoldKey =  new GlobalKey<ScaffoldState>();

   ScrollController _scrollController = ScrollController();

   TextEditingController searchCantrolller = TextEditingController();
  
 

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
    
            child: Image.asset(DRAWER_ICON,color: GRAY_CLR,)),
          iconTheme: IconThemeData(color: BLACK_CLR),
       backgroundColor: WHITE70_CLR,
       elevation: 0,

        centerTitle: true,
        title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        
          children: [
          GestureDetector(
            onTap: (){
                showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context, builder: (ctx)=>LocationBottomSeet());
            },
            child: styleText(LOCATION, GRAY_CLR, FontWeight.normal, 12)),
         
          Padding(
            padding:  EdgeInsets.only(left: w*0.06),
            child: SizedBox(
              width: w*0.4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Icon(Icons.location_on,color: GREEN_CLR,size: 18,),
                  Consumer<ProviderTutorial>(builder: (BuildContext context, value, Widget? child) {  
                  return TutorialText("Mansover jaipur", BLACK70_CLR, FontWeight.bold, 13);
  })
                ],
              ),
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
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Image.asset(SEARCH_ICON,color: GRAY_CLR,),
                                          ),
                                          suffixIcon:Image.asset(FILTTER_ICON) ,
                                          border: InputBorder.none)),
                                  
                                    ),
                                     
                                     SizedBox(height: h*0.020,),
                                    
                                    styleText(SERVICES, BLACK_CLR, FontWeight.bold, 19),
          
          
                                    SizedBox(
                                      height: h*0.010,
                                    ),
          

                                    SizedBox(height: h*0.145,

                                    child: ServicesHealthList(),
                                      
                                    ),
          
                                     Consumer<ServiceHealthProvider>(
                                       builder: (BuildContext context, value, Widget? child) {  
                                       return SizedBox(
                                        height: value.currenindex==0?h*0.6:h*0.050,
                                        child:value.currenindex ==0 ?ServicesList():Center(child: CircularProgressIndicator()));
                                       }
                                     ),
        
                                    styleText(EXPLORE, BLACK_CLR, FontWeight.bold, 19),
        
                                        SizedBox(
                                          height: h*0.015,
                                        ),
                                  ///BogDetailList
                                     SizedBox(
                                      height: h*0.25,
                                       child: BlogDetailsList()
                                     ),
        
            ],),
          ),
        ),
      ),
    );
  }
}






