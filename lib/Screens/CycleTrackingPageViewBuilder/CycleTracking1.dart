import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../UTILS/Utils.dart';

class Cycle_Tracking1 extends StatefulWidget {
  const Cycle_Tracking1({super.key});

  @override
  State<Cycle_Tracking1> createState() => _Cycle_Tracking1State();
}

class _Cycle_Tracking1State extends State<Cycle_Tracking1> {
  final DateRangePickerController controller = DateRangePickerController();
  String date = DateFormat('dd, MM,yyyy').format(DateTime.now()).toString();
  @override
  initState() {
    controller.view = DateRangePickerView.month;
    super.initState();
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      setState(() {
        date = DateFormat('dd-MM-yyyy').format(args.value).toString();
      });
    });
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
        padding: EdgeInsets.all(h * 0.020),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 0.050,
            ),
            styleText("When did your pet`s last\n period start?", DARK_CLR,
                FontWeight.bold, 20),
            SizedBox(
              height: h * 0.030,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: SfDateRangePicker(
                view: DateRangePickerView.month,
                selectionMode: DateRangePickerSelectionMode.single,
                headerHeight: h * 0.060,
                controller: controller,
                onSelectionChanged: selectionChanged,
              ),
            ),
            Text(date)
          ],
        ),
      ),
    );
  }
}
