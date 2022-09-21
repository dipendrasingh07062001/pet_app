import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/AddPeriod.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/CycleTracking_Predication.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/Symptoms.dart';
import 'package:pet_app/UTILS/Utils.dart';


class Cycle_Tracking6 extends StatefulWidget {
  const Cycle_Tracking6({super.key});

  @override
  State<Cycle_Tracking6> createState() => _Cycle_Tracking6State();
}

class _Cycle_Tracking6State extends State<Cycle_Tracking6> {
 var h;
  var w;

final List day = ["S","M","T","W","F","S","T"];
final List image = ['assets/svg_image/icon1.svg','assets/svg_image/icon1.svg','assets/svg_image/icon1.svg','assets/svg_image/icon1.svg','assets/svg_image/icon1.svg','assets/svg_image/icon1.svg','assets/svg_image/icon1.svg',];

int index=0;


 int selectedIndex = 0;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;
  @override
  void initState() {
    super.initState();
    lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
  }

var Date;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: WHITE70_CLR,

      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 65,
        backgroundColor: WHITE70_CLR,
        elevation: 1,
        title: styleText("Cycle Tracking", DARK_CLR, FontWeight.bold, 16),
        actions: [


             Padding(
               padding: const EdgeInsets.all(18),
               child: MaterialButton(
               
                height: 35,
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

                SizedBox(height: 20,),

                Align(
                  alignment: Alignment.center,
                  child: TutorialText("Today, 25 August", BLACK_CLR, FontWeight.bold, 19)),
                  SizedBox(height: 10,),
        
               SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                lastDayOfMonth.day,
                (index) {
                  final currentDate =
                      lastDayOfMonth.add(Duration(days: index + 1));
                  final dayName = DateFormat('E').format(currentDate);
                  return GestureDetector(
                    onTap: () => setState(
                      () {
                        selectedIndex = index;
                      },
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        

                        SizedBox(height: 8,),
                        Container(
                          height: 30.0,
                          width: 30.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? GREEN_CLR
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(44.0),
                          ),
                          child: Text(
                            dayName.substring(0, 1),
                            style: TextStyle(
                              fontSize: 15.0,
                              color: selectedIndex == index
                                  ? WHITE_CLR
                                  : GRAY_CLR,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        SizedBox(height: 8,),
                        Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: SvgPicture.asset("assets/svg_image/icon1.svg",
                              height:selectedIndex == index ?65:50,
                              color: selectedIndex == index
                              ? GREEN_CLR
                              : GREEN_CLR.withOpacity(0.8)
                              ),
                            ),
               ],
                    ),
                  );
                },
              ),
            ),
          ),

          

          SizedBox(height: h*0.020,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          
                
                styleText("Cycle Log", DARK_CLR, FontWeight.normal, 18),
                styleText("Option", GREEN_CLR, FontWeight.normal, 14),
              ],),
          
          
          
          
              SizedBox(height: h*0.005,),
           styleText("MENSTRUATION", FADE_GREEN_CLR, FontWeight.normal, 13),
          
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: h*0.010),
                height: h*0.06,
                width: w*1,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: BROUN_CLR
                ),
          
                child: GestureDetector(
                  onTap: ()=>Navigate_to(context, Symptoms()),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      styleText("Period", BLACK_CLR, FontWeight.normal, 15),
                       Icon(Icons.add,size: 20,color: GRAY_CLR,)
                
                      ],
                               
                                ),
                  ),
                )
                ),
                  SizedBox(height: h*0.025,),
           styleText("OTHER DATA", FADE_GREEN_CLR, FontWeight.normal, 13),
          
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: h*0.010),
                height: h*0.11,
                width: w*1,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: BROUN_CLR
                ),
          
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
             GestureDetector(
                    onTap: ()=>Navigate_to(context, Symptoms()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      styleText("Symptoms", BLACK_CLR, FontWeight.normal, 15),
                       Icon(Icons.add,size: 20,color: GRAY_CLR,)
                  
                      ],
                               
                                ),
                  ),
             SizedBox(height: 5,),
                  Divider(color: GRAY_CLR.withOpacity(0.2),thickness: 2,),
                    GestureDetector(
                    onTap: ()=>Navigate_to(context, Symptoms()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      styleText("Spotting", BLACK_CLR, FontWeight.normal, 15),
                       Icon(Icons.add,size: 20,color: GRAY_CLR,)
                  
                      ],
                               
                                ),
                  )
                    ],
                  ),
                ),
              ),
              SizedBox(height: h*0.020,),
          
          Divider(color: GRAY_CLR.withOpacity(0.4),thickness: 1,),
          
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          
                
                styleText(" Predictions", DARK_CLR, FontWeight.normal, 18),

                GestureDetector(
                  onTap: ()=>Navigate_to(context, CycleTracking_Predication()),
                  child: styleText("Show All", GREEN_CLR, FontWeight.normal, 14)),
              ],),
          
          
          
          
              SizedBox(height: h*0.005,),
           styleText("PERIOD PREDICTION", FADE_GREEN_CLR, FontWeight.normal, 13),
           SizedBox(height: h*0.010,),
            styleText("Your pet’s period is likely to start on or around 23 August", DARK_CLR, FontWeight.normal, 15),
          
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
                                    
                                    styleText("Cycle Tracking Blogs", BLACK_CLR, FontWeight.normal, 19),
        
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