import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Colors/COLORS.dart';
import '../../Provider/predictionProvider.dart';
import '../../UTILS/Utils.dart';

class Cycle_prediction_cal extends StatefulWidget {
  // final day;
  final index;
  const Cycle_prediction_cal({
    super.key,
    // required this.day,
    required this.index,
  });

  @override
  State<Cycle_prediction_cal> createState() => _Cycle_prediction_calState();
}

class _Cycle_prediction_calState extends State<Cycle_prediction_cal> {
  @override
  void initState() {
    // generatedateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Consumer<Predictions>(
      builder: (context, value, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            styleText(
                "Your pet’s period is likely to start on or around" +
                    DateFormat(" dd MMMM")
                        .format(value.showdates[widget.index]),
                DARK_CLR,
                FontWeight.bold,
                15),
            TableCalendar(
                focusedDay: value.showdates[widget.index],
                daysOfWeekHeight: h * 0.03,
                daysOfWeekStyle: DaysOfWeekStyle(
                  dowTextFormatter: (date, locale) {
                    return DateFormat("E").format(date).substring(0, 1);
                  },
                ),
                onDaySelected: ((selectedDay, focusedDay) {}),
                selectedDayPredicate: value.selectedDayPredicate,
                firstDay: value.showdates[widget.index]
                    .subtract(Duration(days: value.iterval)),
                calendarFormat: CalendarFormat.month,
                lastDay: value.showdates[widget.index]
                    .add(Duration(days: value.iterval)),
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: false,
                  selectedDecoration:
                      BoxDecoration(color: RED_CLR, shape: BoxShape.circle),
                ),
                headerStyle: HeaderStyle(
                  // leftChevronVisible: false,
                  leftChevronVisible: false,
                  rightChevronVisible: false,
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
          ],
        );
      },
    );
  }
}
