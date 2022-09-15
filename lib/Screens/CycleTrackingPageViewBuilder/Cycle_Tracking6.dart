import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/AddPeriod.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/CycleTracking_Predication.dart';
import 'package:pet_app/Screens/Symptoms.dart';
import 'package:pet_app/UTILS/Utils.dart';


class Cycle_Tracking6 extends StatefulWidget {
  const Cycle_Tracking6({super.key});

  @override
  State<Cycle_Tracking6> createState() => _Cycle_Tracking6State();
}

class _Cycle_Tracking6State extends State<Cycle_Tracking6> {
 var h;
  var w;


var Date;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: WHITE70_CLR,

      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: h*0.08,
        backgroundColor: WHITE70_CLR,
        elevation: 1,
        title: styleText("Cycle Tracking", DARK_CLR, FontWeight.bold, 16),
        actions: [


             Padding(
               padding: const EdgeInsets.all(20),
               child: MaterialButton(
               
                height: 20,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: GRAY_CLR)
                ),
                onPressed:(){

                  Navigate_to(context, Add_Period());
                },child: Text("Add Period",style: TextStyle(color: GREEN_CLR,fontSize: 12,fontWeight:FontWeight.bold),)

         
          ),
             )
        ],
        ),

        body: Padding(
          padding:  EdgeInsets.only(left: w*0.030,right: w*0.030),
          child: SingleChildScrollView(
            child: Column(
          
          
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                        SizedBox(height: h*0.1,),
          
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          
                
                styleText("Cycle Log", DARK_CLR, FontWeight.bold, 18),
                styleText("Option", GREEN_CLR, FontWeight.bold, 14),
              ],),
          
          
          
          
              SizedBox(height: h*0.005,),
           styleText("MENSTRUATION", FADE_GREEN_CLR, FontWeight.bold, 13),
          
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: h*0.020),
                height: h*0.060,
                width: w*1,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: BROUN_CLR
                ),
          
                child: ListTile(
             onTap: ()=>Navigate_to(context, Symptoms()),
                  leading: styleText("Period", BLACK_CLR, FontWeight.bold, 15),trailing: Icon(Icons.add),),
              ),
                  SizedBox(height: h*0.025,),
           styleText("OTHER DATA", FADE_GREEN_CLR, FontWeight.bold, 13),
          
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: h*0.020),
                height: h*0.15,
                width: w*1,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: BROUN_CLR
                ),
          
                child: Column(
                  children: [
            ListTile(
              onTap: ()=>Navigate_to(context, Symptoms()),
              leading: styleText("Symptoms", BLACK_CLR, FontWeight.bold, 15),trailing: Icon(Icons.add),),
          
            Divider(color: GRAY_CLR.withOpacity(0.4),thickness: 1,),
                      ListTile(
                        
                           onTap: ()=>Navigate_to(context, Symptoms()),
                           leading: styleText("Spotting", BLACK_CLR, FontWeight.bold, 15),trailing: Icon(Icons.add),),
          
                  ],
                ),
              ),
              SizedBox(height: h*0.020,),
          
          Divider(color: GRAY_CLR.withOpacity(0.4),thickness: 1,),
          
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          
                
                styleText(" Predictions", DARK_CLR, FontWeight.bold, 18),

                GestureDetector(
                  onTap: ()=>Navigate_to(context, CycleTracking_Predication()),
                  child: styleText("Show All", GREEN_CLR, FontWeight.bold, 14)),
              ],),
          
          
          
          
              SizedBox(height: h*0.005,),
           styleText("PERIOD PREDICTION", FADE_GREEN_CLR, FontWeight.bold, 13),
           SizedBox(height: h*0.010,),
            styleText("Your pet’s period is likely to start on or around 23 August", DARK_CLR, FontWeight.bold, 15),
          
            SizedBox(height: h*0.020,),
          
             Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                   child: FlutterCalendar(
                    style: const CalendarStyle(
                      rangeLineColor: FADE_GREEN_CLR,
        markerColor: GREEN_CLR,
    ),
                    isHeaderDisplayed: true,
    selectionMode: CalendarSelectionMode.multiple,                  
                onMultipleDates: (List<DateTime> dates) {
              for (var date in dates) {
                Date = date!;
            print(date);
        }
    },
                 ),
                 ),


                //  Text("$Date"),



                   SizedBox(height: h*0.020,),
                                    
                                    styleText("Cycle Tracking Blogs", BLACK_CLR, FontWeight.bold, 19),
        
                                        SizedBox(
                                          height: h*0.015,
                                        ),
                                  
                                     SizedBox(
                                      height: h*0.25,
                                       child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 3,
                                         itemBuilder: (BuildContext context, int index) {  
                                        return Container(
                                             
                                                      padding: EdgeInsets.all(8),                    
                                             height: h*0.25,
                                             alignment: Alignment.bottomCenter,
                                                                          
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            // color: Colors.red,
                                            image: DecorationImage(image: AssetImage("assets/png_image/download-1.png",),fit: BoxFit.cover)
                                          ),
                                         
                                          child: GestureDetector(
                                            onTap:(){},
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 8),
                                              child: SizedBox(
                                                height: h*0.095,width:w*0.42,
                                                child: Card(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                  child: Column(
                                                    // crossAxisAlignment: CrossAxisAlignment.start,
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
                                       
                                         );
                                         }
                                       ),
                                     ),
        
                           SizedBox(height: h*0.050,),
              
            ]),
          ),
        ),
    );
  }
}