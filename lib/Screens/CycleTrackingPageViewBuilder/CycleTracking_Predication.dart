import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';

import '../../Colors/COLORS.dart';
import '../../UTILS/Utils.dart';

class CycleTracking_Predication extends StatefulWidget {
  const CycleTracking_Predication({super.key});

  @override
  State<CycleTracking_Predication> createState() => _CycleTracking_PredicationState();
}

class _CycleTracking_PredicationState extends State<CycleTracking_Predication> {
var Date;
var h;
var w;
  @override
  Widget build(BuildContext context) {
    
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: DefaultAppBar("Cycle Tracking Predictions"),
       backgroundColor: WHITE70_CLR,
    
   body: Padding(
     padding:  EdgeInsets.all(h*0.020),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
                              styleText("PERIOD PREDICTION", GREEN_CLR, FontWeight.bold, 15),
        
                              SizedBox(height: h*0.010,),
        
                  styleText("Your pet’s period is likely to start on or around 23 August", DARK_CLR, FontWeight.normal, 15),
          SizedBox(
            height: h*0.020,
          ),
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

                 SizedBox(
                 height: h*0.020,),
        
              styleText("Next", BLACK70_CLR, FontWeight.bold, 20),
        
                              SizedBox(height: h*0.010,),
                               styleText("PERIOD PREDICTION", GREEN_CLR, FontWeight.bold, 15),
           SizedBox(height: h*0.010,),
                  styleText("Your pet’s period is likely to start on or around 23 August", DARK_CLR, FontWeight.normal, 15),
          SizedBox(
            height: h*0.020,
          ),
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
        
            
        
          ],),
        ),
      ),
    );
  }
}