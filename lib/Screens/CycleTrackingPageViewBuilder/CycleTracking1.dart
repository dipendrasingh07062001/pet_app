import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/CycleTrackingPageViewBuilder/Callender/Callender.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../UTILS/Utils.dart';


class Cycle_Tracking1 extends StatefulWidget {
  const Cycle_Tracking1({super.key});

  @override
  State<Cycle_Tracking1> createState() => _Cycle_Tracking1State();
}

class _Cycle_Tracking1State extends State<Cycle_Tracking1> {
   
  DateRangePickerController _datePickerController = DateRangePickerController();

  @override
  initState() {
    _datePickerController.view = DateRangePickerView.month;
    super.initState();
  }

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

            SizedBox(height: h*0.050,),
                styleText("When did your pet’s last\n period start?", DARK_CLR, FontWeight.bold, 20),
  SizedBox(
    height: h*0.030,
  ),
              
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SfDateRangePicker(
              view: DateRangePickerView.month,
                          selectionMode: DateRangePickerSelectionMode.multiple,
              headerHeight: h*0.060,
            controller: _datePickerController,
                  ),
          ),   
          
    

        ],),
      ),
    );
  }
}


