import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../Colors/COLORS.dart';
import '../Componants/Images&Icons.dart';
import '../Testing1/linearCalender.dart';

class Add_Period extends StatefulWidget {
  const Add_Period({super.key});

  @override
  State<Add_Period> createState() => _Add_PeriodState();
}

class _Add_PeriodState extends State<Add_Period> {
  var h;
  var w;
  final currentdate = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CalenderProvider>().onenter();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar(Select_Peroid),
      body: Padding(
        padding: EdgeInsets.all(h * 0.020),
        child: Column(
          children: [
            Consumer<CalenderProvider>(
              builder: (context, value, child) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: TableCalendar(
                      focusedDay: currentdate,
                      daysOfWeekHeight: h * 0.03,
                      daysOfWeekStyle: DaysOfWeekStyle(
                        dowTextFormatter: (date, locale) {
                          return DateFormat("E").format(date).substring(0, 1);
                        },
                      ),
                      onDaySelected: value.onDaySelected,
                      selectedDayPredicate: (day) =>
                          value.selectedDayPredicate(day),
                      firstDay: value.startdate,
                      calendarFormat: CalendarFormat.month,
                      lastDay: value.enddate,
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: GREEN_CLR.withOpacity(0.5),
                        ),
                        selectedDecoration: BoxDecoration(
                            color: GREEN_CLR, shape: BoxShape.circle),
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
                          return DateFormat("MMMM d").format(date);
                        },
                      )),

                  //     FlutterCalendar(
                  //   onDayPressed: (DateTime dateTime) {
                  //     context.read<CalenderProvider>().ondaypressed(dateTime);
                  //     print(dateTime);
                  //   },
                  //   style: const CalendarStyle(
                  //     rangeLineColor: FADE_GREEN_CLR,
                  //     markerColor: GREEN_CLR,
                  //   ),
                  //   isHeaderDisplayed: true,
                  //   selectedDates:
                  //       context.read<CalenderProvider>().selecteddays.map((e) {
                  //     // if(e.iscycle){
                  //     return e.date;
                  //     // }
                  //   }).toList(),

                  //   selectionMode: CalendarSelectionMode.multiple,
                  //   onMultipleDates: (List<DateTime> dates) {

                  //   },
                  // ),
                );
              },
            ),
            SizedBox(
              height: h * 0.040,
            ),
            context.read<CalenderProvider>().ondone
                ? loader
                : DefaultButton(
                    text: DONE,
                    ontap: () {
                      context.read<CalenderProvider>().onDone(context);
                    },
                    fontsize: 15,
                    height: h * 0.060,
                    width: w * 0.8)
          ],
        ),
      ),
    );
  }
}
