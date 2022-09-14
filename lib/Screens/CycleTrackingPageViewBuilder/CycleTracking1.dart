import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';
import 'package:pet_app/Colors/COLORS.dart';

import '../../UTILS/Utils.dart';


class Cycle_Tracking1 extends StatefulWidget {
  const Cycle_Tracking1({super.key});

  @override
  State<Cycle_Tracking1> createState() => _Cycle_Tracking1State();
}

class _Cycle_Tracking1State extends State<Cycle_Tracking1> {

  var Date;
var h;
var w;
  @override
  Widget build(BuildContext context) {
    
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      
       backgroundColor: WHITE70_CLR,
    
   body: Padding(
     padding:  EdgeInsets.all(h*0.020),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                styleText("When did your pet’s last\n period start?", DARK_CLR, FontWeight.bold, 20),
  SizedBox(
    height: h*0.020,
  ),
               Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                 child: FlutterCalendar(
                  isHeaderDisplayed: true,
                             selectionMode: CalendarSelectionMode.single,
                            onDayPressed: (DateTime date) {
                             date = Date;
                             print(date);
                   }
               ),
               ),

    

        ],),
      ),
    );
  }
}