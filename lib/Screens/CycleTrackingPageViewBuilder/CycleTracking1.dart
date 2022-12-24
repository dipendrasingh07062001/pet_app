import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Testing1/linearCalender.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Provider/AddCycle.dart';
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
    context.read<AddCycleProvider>().focusedDate = DateTime.now();
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
                child: Consumer<AddCycleProvider>(
                  builder: (context, value, child) {
                    return TableCalendar(
                        focusedDay: DateTime.now(),
                        daysOfWeekHeight: h * 0.03,
                        daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextStyle(color: GREEN_CLR),
                          weekendStyle: TextStyle(color: GREEN_CLR),
                          decoration: BoxDecoration(
                              color: Color(0xFFF4F6F8),
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                color: Colors.grey.shade200,
                              ))),
                          dowTextFormatter: (date, locale) {
                            return DateFormat("E").format(date).substring(0, 1);
                          },
                        ),
                        selectedDayPredicate: value.selectedDayPredicate,
                        onDaySelected: ((selectedDay, focusedDay) =>
                            value.onSingleDaySeclect(selectedDay, focusedDay)),
                        firstDay: value.startdate,
                        calendarFormat: CalendarFormat.month,
                        lastDay: value.enddate,
                        calendarStyle: CalendarStyle(
                          selectedDecoration: BoxDecoration(
                            color: GREEN_CLR,
                            shape: BoxShape.circle,
                          ),
                          todayDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: GREEN_CLR.withOpacity(0.5),
                          ),
                        ),
                        headerStyle: HeaderStyle(
                          // leftChevronVisible: false,

                          leftChevronPadding: EdgeInsets.all(2),
                          rightChevronPadding: EdgeInsets.all(2),
                          leftChevronMargin: EdgeInsets.all(0),
                          rightChevronMargin: EdgeInsets.all(0),
                          leftChevronIcon: Icon(
                            Icons.chevron_left,
                            color: GREEN_CLR,
                          ),
                          rightChevronIcon: Icon(
                            Icons.chevron_right,
                            color: GREEN_CLR,
                          ),

                          formatButtonVisible: false,
                          titleTextFormatter: (date, locale) {
                            return DateFormat("MMMM yyyy").format(date);
                          },
                        ));
                  },
                )
                //  SfDateRangePicker(
                //   view: DateRangePickerView.month,
                //   selectionMode: DateRangePickerSelectionMode.single,
                //   headerHeight: h * 0.060,
                //   controller: controller,
                //   onSelectionChanged: selectionChanged,
                // ),
                ),
            // Text(context.watch<AddCycleProvider>().selectedDate)
          ],
        ),
      ),
    );
  }
}
