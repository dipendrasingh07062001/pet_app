import 'package:flutter/material.dart';
import 'package:flutter_calendar_widget/flutter_calendar_widget.dart';
import 'package:pet_app/UTILS/Utils.dart';

import '../Colors/COLORS.dart';

class Add_Period extends StatefulWidget {
  const Add_Period({super.key});

  @override
  State<Add_Period> createState() => _Add_PeriodState();
}

class _Add_PeriodState extends State<Add_Period> {
 var h;
var w;
  @override
  Widget build(BuildContext context) {
    
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      
       backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar("Select Period Days"),

      body: Padding(
        padding:  EdgeInsets.all(h*0.020),
        child: Column(children: [
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
               
            print(date);
        }
    },
                 ),
                 ),

                 SizedBox(height: h*0.040,),

                 DefaultButton(text: "Done", ontap: (){}, fontsize: 15, height: h*0.060, width: w*0.8)
        ],),
      ),
    );
  }
}